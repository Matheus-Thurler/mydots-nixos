{ config, pkgs, ... }:

{
  home.username = "matheus";
  home.homeDirectory = "/home/matheus";
  home.stateVersion = "24.11"; 

  # Importando todos os módulos de usuário
  imports = [
    ./modules/user/packages.nix
    ./modules/user/git.nix
    ./modules/user/ssh.nix
    ./modules/user/shell.nix
    ./modules/user/vscode.nix
  ];
}