{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # HABILITANDO FLAKES
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Rede
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  services.rpcbind.enable = true; # Para NFS

  # 1. Habilitar ZSH no sistema (obrigatório para ser shell padrão)
  programs.zsh.enable = true;
  users.users.matheus.shell = pkgs.zsh;

  # 2. Instalar Fontes para o Powerlevel10k
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
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
    device = "192.168.68.103:/mnt/NFS_HOUSE/work";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
  };
  
  # Permitir software proprietário
  nixpkgs.config.allowUnfree = true;
}