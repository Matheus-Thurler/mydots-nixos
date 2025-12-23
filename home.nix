{ config, pkgs, vars, ... }:

{
  home.username = "${vars.username}";
  home.homeDirectory = "/home/${vars.username}";
  home.stateVersion = "${vars.stateVersion}"; 

  imports = [
    ./modules/user/packages.nix
    ./modules/user/git.nix
    ./modules/user/ssh.nix
    ./modules/user/shell.nix
    ./modules/user/vscode.nix
    ./modules/user/davinci.nix
    ./modules/user/hyprland
    ./modules/user/waybar
    ./modules/user/rofi
    ./modules/user/wlogout
    ./modules/user/swaync
    ./modules/user/hyprlock
    ./modules/user/hypridle
    ./modules/user/terminal/kitty.nix
    ./modules/user/theme.nix # GTK/QT Theming
  ];
  # Override do Menu de Apps (Rofi) para usar nosso Wrapper do DaVinci
}