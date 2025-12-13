{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports =
    [ 
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      
      # Importando módulos do Sistema
      ./modules/system/core.nix
      ./modules/system/nvidia.nix
      ./modules/system/desktop.nix
      ./modules/system/apps.nix
    ];

  # Definição básica do usuário no sistema (Necessário para login)
  users.users.matheus = {
    isNormalUser = true;
    description = "Matheus";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Configuração do Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.matheus = import ./home.nix;
  };

  system.stateVersion = "25.11"; 
}