{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = false; # Disable systemd to rely entirely on Hyprland exec-once
    style = ./style.css;
    settings = {
      mainBar = builtins.fromJSON (builtins.readFile ./config.jsonc);
    };
  };
}
