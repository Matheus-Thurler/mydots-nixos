{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "NIXOS_OZONE_WL,1"      # Força apps Electron/Chromium a usar Wayland
      "XCURSOR_SIZE,24"       # Tamanho do cursor
    ];

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };
      # Sombra (drop shadow)
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
        # Fix: Vertical slide for special workspaces (Quake style)
        "specialWorkspace, 1, 6, default, slidevert"
      ];
    };
  };
}