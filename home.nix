{ config, pkgs, ... }:

{
  home.username = "matheus";
  home.homeDirectory = "/home/matheus";
  home.stateVersion = "24.11"; 

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  }; 

  # Importando todos os módulos de usuário
  imports = [
    ./modules/user/packages.nix
    ./modules/user/git.nix
    ./modules/user/ssh.nix
    ./modules/user/shell.nix
    ./modules/user/vscode.nix
    ./modules/user/hyprland
    # ./modules/user/quickshell # Deprecated
    ./modules/user/waybar
    ./modules/user/rofi
    ./modules/user/wlogout
    ./modules/user/swaync
    ./modules/user/hyprlock
  ];
}