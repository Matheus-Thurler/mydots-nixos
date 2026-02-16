{ config, pkgs, vars, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # HABILITANDO FLAKES
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # nix.settings = {
  #   experimental-features = [ "nix-command" "flakes" ];
  #   substituters = [ "https://cosmic.cachix.org/" ];
  #   trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjXPe96e9mMBdLxvl58AQA/CdLuyc=" ];
  # };

  # Rede
  networking.hostName = "${vars.hostName}"; 
  networking.networkmanager.enable = true;
  services.rpcbind.enable = true; # Para NFS

  # Funcionalidades do Thunar (GVFS + Thumbnails)
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # 1. Habilitar ZSH no sistema (obrigatório para ser shell padrão)
  programs.zsh.enable = true;
  programs.dconf.enable = true; # Fix GTK Themes
  users.users.${vars.username}.shell = pkgs.zsh;

  # Drivers e Módulos do Kernel
  boot.kernelModules = [ "i2c-dev" ]; 
  
  # Logitech Support (Solaar)
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true; # Adds Solaar installed

  # Bluetooth Support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Enable I2C for DDC (Monitor Brightness)

  # 2. Instalar Fontes para o Powerlevel10k e Ícones
  fonts.packages = with pkgs; [
    # Nerd Fonts
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.droid-sans-mono
    nerd-fonts.symbols-only
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono

    # Ícones e Emojis
    font-awesome
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    material-design-icons
  ];

  # Timezone e Locale
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

  # Mount NFS (Exemplo)
   fileSystems."/home/matheus/NasWork" = { 
     device = "10.0.40.10:/mnt/NFS_HOUSE/work";
     fsType = "nfs";
     options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
   };
  
  # Permitir software proprietário
  nixpkgs.config.allowUnfree = true;

  # 1. Configuração do Garbage Collector (Limpeza de Disco)
  nix.gc = {
    automatic = true;
    dates = "weekly"; # Executa semanalmente. Pode ser "daily", "03:15", etc.
    # Remove gerações anteriores que são mais antigas que 7 dias
    options = "--delete-older-than 7d"; 
  };

  # 2. Otimização Automática (Opcional, mas recomendado)
  # Isso ajuda a economizar espaço deduplicando arquivos idênticos no /nix/store
  nix.settings.auto-optimise-store = true;

  # 3. Limitar Backups no Menu de Boot
  # Isso garante que seu menu de boot não fique cheio de opções antigas.
  # Escolha APENAS UMA das opções abaixo, dependendo se usa systemd-boot ou GRUB:

  # Opção A: Se você usa systemd-boot (Padrão em instalações UEFI modernas)
  boot.loader.systemd-boot.configurationLimit = 3;
}