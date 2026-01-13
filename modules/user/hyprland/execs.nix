{ config, pkgs, ... }:

let
  shellConfig = import ../shell-config.nix;
  activeShell = shellConfig.activeShell;
  
  # Determine which shell to start
  shellCommand = 
    if activeShell == "waybar" then
      "waybar"
    else if activeShell == "caelestia" then
      "caelestia-shell"
    else if activeShell == "dms" then
      "dms run"
    else
      ""; # fallback - no shell
in
{
  # Install restart-shell script to ~/.config/hypr/
  home.file.".config/hypr/restart-shell.sh" = {
    source = ./restart-shell.sh;
    executable = true;
  };
  
  wayland.windowManager.hyprland.settings = {
    # Core services only (shell started by restart script)
    exec-once = [
      "swww-daemon" # Wallpaper Manager
      "hypridle"    # Idle Manager (Auto Lock/Sleep)
      "pypr"        # Scratchpads plug-in
    ];
    
    # Runs on every config reload - switches shell automatically
    exec = [
      "~/.config/hypr/restart-shell.sh"
    ];
  };
}