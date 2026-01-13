{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      
      # Módulos do Sistema
      ./modules/system/core.nix
      ./modules/system/nvidia.nix
      ./modules/system/desktop.nix
      ./modules/system/apps.nix
    ];

  # Definição do usuário
  users.users.matheus = {
    isNormalUser = true;
    description = "Matheus";
    extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers"];
  };

  # OBS: Removemos o bloco 'home-manager' daqui. 
  # Agora ele é configurado diretamente lá no arquivo flake.nix

  # DankMaterialShell (disabled - using Caelestia)
  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = false;  # Disabled - managed by restart-shell.sh
      restartIfChanged = false;
    };
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = false;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = false;
  };

  system.stateVersion = "25.11"; 
}