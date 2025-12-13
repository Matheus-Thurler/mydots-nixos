{ config, pkgs, ... }:

let
  # Definindo a origem do Home Manager (Branch Master para compatibilidade com NixOS Unstable/25.11)
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Importando o módulo do Home Manager
      (import "${home-manager}/nixos")
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
      ocl-icd
      egl-wayland
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Variáveis para forçar compatibilidade NVIDIA + Wayland + OBS
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NIXOS_OZONE_WL = "1"; 
  };

  services.xserver.videoDrivers = ["nvidia"];
  
  # Habilita o OBS Studio com suporte correto a OpenGL/NVENC e Plugins
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override { 
      cudaSupport = true; 
    };
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs             
      obs-backgroundremoval 
      obs-pipewire-audio-capture 
    ];
  };

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  console.keyMap = "us-acentos";
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.matheus = {
    isNormalUser = true;
    description = "Matheus";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
     davinci-resolve
     antigravity
     google-chrome
     # VSCode movido para o home-manager abaixo
    ];
  };

  # Configuração do NFS montado na Home do usuário
  fileSystems."/home/matheus/NasWork" = { 
    device = "192.168.68.103:/mnt/NFS_HOUSE/work";
    fsType = "nfs";
    options = [ 
      "x-systemd.automount" 
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };

  services.rpcbind.enable = true;
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nfs-utils
    git 
  ];

  # --- CONFIGURAÇÃO DO HOME MANAGER ---
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    
    users.matheus = { pkgs, ... }: {
      home.stateVersion = "24.11"; 

      home.packages = with pkgs; [
        htop
        btop
        ripgrep
        jq
        fzf
      ];

      programs.vscode = {
        enable = true;
      };

      programs.git = {
        enable = true;
        userName = "Matheus Thurler";
        userEmail = "contato@matheusthurler.com.br";
      };
      
      # ### SSH CONFIGURATION ###
      programs.ssh = {
        enable = true;
        matchBlocks = {
          # Host pessoal
          "matheus" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/matheus/id_rsa";
            identitiesOnly = true;
          };
          
          # Host Ezops
          "ezops" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/ezops/id_rsa";
            extraOptions = { PreferredAuthentications = "publickey"; };
          };

          # GitLab
          "gitlab.com" = {
            hostname = "gitlab.com";
            user = "git";
            identityFile = "~/.ssh/matheus-gitlab/id_rsa_matheus_gitlab";
            extraOptions = { PreferredAuthentications = "publickey"; };
          };

          # AWS Ohio Mail Server
          "ezops-ohio-mail-server" = {
            hostname = "ec2-3-16-161-106.us-east-2.compute.amazonaws.com";
            user = "ubuntu";
            identityFile = "~/.ssh/matheus-ohio.pem";
          };

          # Bitbucket
          "bitbucket.org" = {
            hostname = "bitbucket.org";
            user = "git";
            identityFile = "~/.ssh/sobol/id_rsa";
            extraOptions = { PreferredAuthentications = "publickey"; };
          };
        };
      };

      programs.bash = {
        enable = true;
        shellAliases = {
          ll = "ls -l";
          rebuild = "sudo nixos-rebuild switch";
          update = "sudo nix-channel --update && sudo nixos-rebuild switch";
        };
      };
    };
  };

  system.stateVersion = "25.11"; 
}