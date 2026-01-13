{
  # DMS-specific keybinds
  # Standard binds that work well with DMS
  
  bind = [
    ##! Applications
    "Super, R, exec, rofi -show drun # App launcher"
    
    ##! System
    "Super, U, exec, hyprctl reload # Reload Hyprland (switch shell)"
    
    ##! Utilities
    ###! Screenshots (grim + slurp)
    "Super+Shift, S, exec, grim -g \"$(slurp)\" - | wl-copy # Screenshot region"
    ", Print, exec, grim -g \"$(slurp)\" - | wl-copy # Screenshot"
    
    ###! Tools
    "Super+Shift, C, exec, hyprpicker -a # Color picker"
    "Super, L, exec, hyprlock # Lock screen"
    "Super, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy # Clipboard history"
    
    ##! DMS Specific
    "Super, K, exec, dms ipc call keybinds toggle hyprland # Show keybinds"
  ];
}
