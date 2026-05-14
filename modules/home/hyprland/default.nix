{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor e Escala
      monitor = ",preferred,auto,1";

      # Teclado Global
      input = {
        kb_layout = lib.mkDefault "br";
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

      # Controle de Áudio e Mídia
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
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

  # Tema Escuro e GTK
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk4.theme = config.gtk.theme;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
