{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "nm-applet --indicator"
      "swaync"
      "swww init" # Wallpaper Manager

      # Example: Open browser or terminal always
      # "[workspace 1 silent] kitty"
    ];
  };
}