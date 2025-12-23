{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "nm-applet --indicator"
      "swaync"
      "swww-daemon" # Wallpaper Manager
      "hypridle"    # Idle Manager (Auto Lock/Sleep)
      "pypr"        # Scratchpads plug-in (Correct binary name)

      # Example: Open browser or terminal always
      # "[workspace 1 silent] kitty"
    ];
  };
}