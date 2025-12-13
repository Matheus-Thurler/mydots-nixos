{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Regras para o Terminal Quake (Drop-down)
      "float, class:^(kitty-dropterm)$"
      "size 70% 50%, class:^(kitty-dropterm)$"
      "move 15% 0, class:^(kitty-dropterm)$"
      "workspace special:magicterm, class:^(kitty-dropterm)$"
    ];
  };
}
