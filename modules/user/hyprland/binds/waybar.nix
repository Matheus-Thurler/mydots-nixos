{
  # Waybar-specific keybinds
  # Traditional screenshot with grim+slurp
  
  bind = [
    ##! Applications
    "Super, R, exec, rofi -show drun # App launcher (Rofi)"
    
    ##! System
    "Super, U, exec, hyprctl reload # Reload Hyprland (switch shell)"
    
    ##! Utilities
    ###! Screenshots (grim + slurp)
    "Super+Shift, S, exec, grim -g \"$(slurp)\" - | wl-copy # Screenshot region"
    ", Print, exec, grim -g \"$(slurp)\" - | wl-copy # Screenshot"
    
    ###! Tools
    "Super+Shift, C, exec, hyprpicker -a # Color picker"
    "Super, L, exec, hyprlock # Lock screen"
  ];
}
