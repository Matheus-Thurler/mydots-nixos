{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Pavucontrol - Float e Centralizado
      "match:class ^(pavucontrol)$, float 1"
      "match:class ^(pavucontrol)$, size 800 600"
      "match:class ^(pavucontrol)$, center 1"

      # Calendar (gsimplecal) - Float e Topo Central (Abaixo do relógio)
      "match:class ^(gsimplecal)$, float 1"
      "match:class ^(gsimplecal)$, pin 1"
      "match:class ^(gsimplecal)$, move 44% 45"

      # Picture-in-Picture
      "match:title ^(Picture-in-Picture)$, float 1"
      "match:title ^(Picture-in-Picture)$, pin 1"
    ];
  };
}
