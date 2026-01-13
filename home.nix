{ config, pkgs, vars, inputs, ... }:

{
  home.username = "${vars.username}";
  home.homeDirectory = "/home/${vars.username}";
  home.stateVersion = "${vars.stateVersion}"; 

  imports = [
    ./modules/user/packages.nix
    ./modules/user/git.nix
    ./modules/user/ssh.nix
    ./modules/user/shell.nix
    ./modules/user/waybar/default.nix
    
    # ./modules/user/colorshell/default.nix
    ./modules/user/vscode.nix
    # ./modules/user/davinci.nix
    ./modules/user/hyprland
    ./modules/user/waybar
    ./modules/user/rofi
    ./modules/user/wlogout
    ./modules/user/swaync
    ./modules/user/hyprlock
    ./modules/user/hypridle
    ./modules/user/terminal/kitty.nix
    ./modules/user/theme.nix # GTK/QT Theming
    ./modules/user/caelestia # Caelestia Shell
    #./modules/user/dms # DMS is NixOS module, not Home Manager
  ];

  # Override do Menu de Apps (Rofi) para usar nosso Wrapper do DaVinci
}
