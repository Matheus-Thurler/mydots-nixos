{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor e Escala
      monitor = ",preferred,auto,1";

      # Teclado Global
      input = {
        kb_layout = "br";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      # Ajuste NVIDIA
      cursor = {
        no_hardware_cursors = true;
      };

      # Variáveis de Ambiente Comuns
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,Yaru"
      ];

      # Atalhos de Screenshot (Grim + Slurp + Swappy)
      bind = [
        ", Print, exec, grim - | wl-copy"
        "SUPER SHIFT, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
      ];
    };
  };

  # Cursor Theme (Ubuntu Style)
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.yaru-theme;
    name = "Yaru";
    size = 24;
  };
}
