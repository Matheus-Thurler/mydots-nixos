{ config, lib, pkgs, ... }:

let
  shellConfig = import ../shell-config.nix;
  activeShell = shellConfig.activeShell;
  
  # Import keybinds based on active shell
  shellBinds = 
    if activeShell == "waybar" then
      import ./binds/waybar.nix
    else if activeShell == "caelestia" then
      import ./binds/caelestia.nix
    else if activeShell == "dms" then
      import ./binds/dms.nix
    else
      {}; # fallback
  
  commonBinds = import ./binds/common.nix;
in
{
  wayland.windowManager.hyprland.settings = 
    lib.mkMerge [
      commonBinds     # Base keybinds (always active)
      shellBinds      # Shell-specific overrides
    ];
}