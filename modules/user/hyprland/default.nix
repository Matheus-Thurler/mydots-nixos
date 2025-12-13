{ config, pkgs, ... }:

{
  imports = [
    ./monitors.nix
    ./variables.nix
    ./execs.nix
    ./binds.nix
    ./windowrules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    
    # Configurações Gerais do Layout (Dwindle) e Input
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      input = {
        kb_layout = "us";
        kb_variant = "intl";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
    };
  };
}