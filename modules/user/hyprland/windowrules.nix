{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      
      # Pavucontrol - Float e Centralizado
      "float, class:(pavucontrol)"
      "size 800 600, class:(pavucontrol)"
      "center, class:(pavucontrol)"

      # Calendar (gsimplecal) - Float e Topo Central (Abaixo do relógio)
      "float, class:(gsimplecal)"
      "pin, class:(gsimplecal)"
      "move 44% 45, class:(gsimplecal)"

      # Picture-in-Picture
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
    ];
  };
}
