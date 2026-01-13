{
  # Caelestia-specific keybinds
  # Uses caelestia submaps and actions
  
  bind = [
    ##! Launcher
    "Super, Space, exec, caelestia shell launcher # Launcher"
    
    ##! System
    "Super, U, exec, hyprctl reload # Reload Hyprland (switch shell)"
    
    ##! Caelestia Actions
    "Super, L, exec, caelestia shell lock # Lock screen"
    "Super+Shift, Escape, exec, caelestia shell session # Session menu"
    "Super+Shift, N, exec, caelestia shell clearNotifs # Clear notifications"
    
    ##! Utilities
    ###! Screenshots (Caelestia)
    "Super+Shift, S, exec, caelestia screenshot freeze # Screenshot with freeze"
    "Super+Shift+Alt, S, exec, caelestia screenshot # Screenshot region"
    ", Print, exec, caelestia screenshot # Full screenshot"
    
    ###! Tools
    "Super+Shift, C, exec, hyprpicker -a # Color picker"
    "Super, V, exec, caelestia clipboard # Clipboard"
    "Super, Period, exec, caelestia emoji -p # Emoji picker"
  ];
}
