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
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # OBS: Removemos o bloco 'home-manager' daqui. 
  # Agora ele é configurado diretamente lá no arquivo flake.nix

  system.stateVersion = "25.11"; 
}