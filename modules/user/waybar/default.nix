{ config, pkgs, lib, ... }:

{
  # Disable the module to avoid any config merging/collisions
  programs.waybar.enable = false;

  # Install manually
  home.packages = [ pkgs.waybar ];

  # Force exact config files
  xdg.configFile."waybar/config".source = ./config.jsonc;
  xdg.configFile."waybar/style.css".source = ./style.css;
}
