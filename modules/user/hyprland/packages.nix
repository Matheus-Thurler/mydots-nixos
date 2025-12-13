{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI Utils (Relacionados ao Workflow)
    rofi
    xfce.thunar
    adwaita-icon-theme

    # Hyprland Essentials
    waybar
    dunst
    swww
    networkmanagerapplet
  ];
}
