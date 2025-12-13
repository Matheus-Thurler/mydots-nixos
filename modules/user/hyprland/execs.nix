{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "nm-applet --indicator"
      "dunst"
      "swww init" # Gerenciador de wallpaper
      
      # Terminal Quake (Drop-down) - Inicia silenciosamente no workspace especial
      "[workspace special:magicterm silent] kitty --class kitty-dropterm"
      
      # Exemplo: Abrir o navegador ou terminal sempre
      # "[workspace 1 silent] kitty"
    ];
  };
}