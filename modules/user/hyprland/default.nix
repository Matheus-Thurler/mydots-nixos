{ config, pkgs, ... }:

{
  imports = [
    ./monitors.nix
    ./variables.nix
    ./execs.nix
    ./binds.nix
    ./windowrules.nix
    ./packages.nix
    ./scripts.nix
    ./workspaces.nix # Disabled for stability test -> Re-enabled
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    
    # Configurações Gerais do Layout (Dwindle) e Input
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(c0caf5)";
        "col.inactive_border" = "rgba(565f89cc)";
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

  # Link Pyprland Config
  # Link Pyprland Config (Hot Reload enabled)
  xdg.configFile."hypr/pyprland.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/matheus/mydots-nixos/modules/user/hyprland/pyprland.toml";

  # Portals (Obrigatório para OBS e Screenshare)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "hyprland" ];
  };
}