{ pkgs, lib, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/home/matheus/NasWork" = {
    device = "10.0.40.10:/mnt/NFS_HOUSE/work";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager = {
    enable = true;
    plugins = [ pkgs.networkmanager-openvpn ];
  };

  environment.systemPackages = with pkgs; [
    pkgs.networkmanagerapplet
    # Wrapper customizado para Steam com NVIDIA
    (writeScriptBin "steam-nvidia" ''
      #!/bin/sh
      # Forçar X11 para o Steam (evita problemas de cursor com NVIDIA+Wayland)
      unset WAYLAND_DISPLAY
      GBM_BACKEND=nvidia __GLX_VENDOR_LIBRARY_NAME=nvidia steam "$@"
    '')
  ];

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
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.hyprland.enable = true;

  systemd.services.display-manager.restartIfChanged = false;
  systemd.services.NetworkManager.restartIfChanged = false;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.gnome.evolution-data-server.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = true;

  virtualisation.docker.enable = true;

  users.users.matheus = {
    isNormalUser = true;
    description = "Matheus Thurler";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  programs.firefox.enable = true;

  # Steam - Configuração simples para NVIDIA
  programs.steam = {
    enable = true;
  };

  programs.fish.enable = true;
  programs.dconf.enable = true;
  programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.etc."distrobox/distrobox.conf".text = ''
    container_additional_volumes="/nix/store:/nix/store:ro /etc/profiles/per-user:/etc/profiles/per-user:ro /etc/static/profiles/per-user:/etc/static/profiles/per-user:ro"
  '';

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
  ];

  system.stateVersion = "25.11";
}