{
  # Common keybinds - Always active regardless of shell
  # These work with any bar/shell (Waybar, Caelestia, DMS, etc.)
  
  bind = [
    ##! Applications
    "Super, Return, exec, kitty # Terminal"
    "Super, B, exec, firefox # Firefox browser"
    "Super, W, exec, google-chrome-stable # Chrome browser"
    "Super, E, exec, thunar # File manager"
    
    ##! Window Management
    ###! Basic Actions
    "Super, Q, killactive # Close window"
    "Super, F, fullscreen, 0 # Fullscreen"
    "Super+Shift, F, fullscreen, 1 # Borderless fullscreen"
    "Super, Space, togglefloating # Toggle floating"
    "Super, P, pin # Pin window"
    
    ###! Focus
    "Super, left, movefocus, l # Focus left"
    "Super, right, movefocus, r # Focus right"
    "Super, up, movefocus, u # Focus up"
    "Super, down, movefocus, d # Focus down"
    
    ###! Move Windows
    "Super+Shift, left, movewindow, l # Move window left"
    "Super+Shift, right, movewindow, r # Move window right"
    "Super+Shift, up, movewindow, u # Move window up"
    "Super+Shift, down, movewindow, d # Move window down"
    
    ##! Workspaces
    ###! Switch Workspace
    "Super, 1, workspace, 1 # Workspace 1"
    "Super, 2, workspace, 2 # Workspace 2"
    "Super, 3, workspace, 3 # Workspace 3"
    "Super, 4, workspace, 4 # Workspace 4"
    "Super, 5, workspace, 5 # Workspace 5"
    "Super, 6, workspace, 6 # Workspace 6"
    "Super, 7, workspace, 7 # Workspace 7"
    "Super, 8, workspace, 8 # Workspace 8"
    "Super, 9, workspace, 9 # Workspace 9"
    "Super, 0, workspace, 10 # Workspace 10"
    
    ###! Move to Workspace
    "Super+Shift, 1, movetoworkspace, 1 # Move to workspace 1"
    "Super+Shift, 2, movetoworkspace, 2 # Move to workspace 2"
    "Super+Shift, 3, movetoworkspace, 3 # Move to workspace 3"
    "Super+Shift, 4, movetoworkspace, 4 # Move to workspace 4"
    "Super+Shift, 5, movetoworkspace, 5 # Move to workspace 5"
    "Super+Shift, 6, movetoworkspace, 6 # Move to workspace 6"
    "Super+Shift, 7, movetoworkspace, 7 # Move to workspace 7"
    "Super+Shift, 8, movetoworkspace, 8 # Move to workspace 8"
    "Super+Shift, 9, movetoworkspace, 9 # Move to workspace 9"
    "Super+Shift, 0, movetoworkspace, 10 # Move to workspace 10"
    
    ###! Special Workspace
    "Super, S, togglespecialworkspace, special # Toggle scratchpad"
    
    ###! Navigate
    "Super, mouse_down, workspace, -1 # Previous workspace (scroll)"
    "Super, mouse_up, workspace, +1 # Next workspace (scroll)"
    "Super+Alt, mouse_down, movetoworkspace, -1 # Move to previous"
    "Super+Alt, mouse_up, movetoworkspace, +1 # Move to next"
    
    ##! System
    "Super, U, exec, hyprctl reload # Reload Hyprland (switch shell)"
    
    ##! Scratchpads (Pyprland)
    "Super, Z, exec, pypr toggle term # Terminal dropdown"
    "Super, N, exec, pypr toggle notes # Notes editor"
    
    ##! Groups
    "Super, G, togglegroup # Toggle window group"
    "Super+Shift, G, moveoutofgroup # Ungroup window"
    "Super+Shift, Comma, lockactivegroup, toggle # Lock/unlock group"
  ];
  
  binde = [
    ##! Workspace Navigation
    "Super, Page_Up, workspace, -1 # Previous workspace"
    "Super, Page_Down, workspace, +1 # Next workspace"
    "Super+Alt, Page_Up, movetoworkspace, -1 # Move to previous"
    "Super+Alt, Page_Down, movetoworkspace, +1 # Move to next"
    
    ##! Window Resize
    "Super, Minus, splitratio, -0.1 # Decrease split"
    "Super, Equal, splitratio, 0.1 # Increase split"
  ];
  
  bindl = [
    ##! Media & Volume
    ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle # Toggle mic"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle # Toggle audio"
    "Super+Shift, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle # Mute"
  ];
  
  bindle = [
    ##! Volume Control
    ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ # Volume up"
    ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- # Volume down"
  ];
  
  bindm = [
    ##! Mouse Actions
    "Super, mouse:272, movewindow # Move with mouse"
    "Super, mouse:273, resizewindow # Resize with mouse"
  ];
}
