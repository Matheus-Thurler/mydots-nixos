{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # Caelestia Shell keybinds with submaps
    exec = "hyprctl dispatch submap global";
    submap = "global";
    
    # Super key launcher
    bindi = "Super, Super_L, global, caelestia:launcher";
    
    # Launcher interrupts
    bindin = [
      "Super, catchall, global, caelestia:launcherInterrupt"
      "Super, mouse:272, global, caelestia:launcherInterrupt"
      "Super, mouse:273, global, caelestia:launcherInterrupt"
      "Super, mouse_up, global, caelestia:launcherInterrupt"
      "Super, mouse_down, global, caelestia:launcherInterrupt"
    ];
    
    # Regular binds (consolidated)
    bind = [
      # Caelestia actions
      "Super+Shift, Escape, global, caelestia:session"
      "Super+Shift, N, global, caelestia:clearNotifs"
      "Super+Shift, P, global, caelestia:showall"
      "Super, L, global, caelestia:lock"
      "Super+Shift, S, global, caelestia:screenshotFreeze"
      "Super+Shift+Alt, S, global, caelestia:screenshot"
      
      # Apps
      "Super, Return, exec, kitty"
      "Super, B, exec, firefox"
      "Super, W, exec, google-chrome-stable"
      "Super, E, exec, thunar"
      
      # Window management
      "Super, Q, killactive"
      "Super, F, fullscreen, 0"
      "Super+Shift, F, fullscreen, 1"
      "Super, Space, togglefloating"
      "Super, P, pin"
      
      # Focus
      "Super, left, movefocus, l"
      "Super, right, movefocus, r"
      "Super, up, movefocus, u"
      "Super, down, movefocus, d"
      
      # Move windows
      "Super+Shift, left, movewindow, l"
      "Super+Shift, right, movewindow, r"
      "Super+Shift, up, movewindow, u"
      "Super+Shift, down, movewindow, d"
      
      # Workspaces
      "Super, 1, workspace, 1"
      "Super, 2, workspace, 2"
      "Super, 3, workspace, 3"
      "Super, 4, workspace, 4"
      "Super, 5, workspace, 5"
      "Super, 6, workspace, 6"
      "Super, 7, workspace, 7"
      "Super, 8, workspace, 8"
      "Super, 9, workspace, 9"
      "Super, 0, workspace, 10"
      
      # Move to workspace
      "Super+Shift, 1, movetoworkspace, 1"
      "Super+Shift, 2, movetoworkspace, 2"
      "Super+Shift, 3, movetoworkspace, 3"
      "Super+Shift, 4, movetoworkspace, 4"
      "Super+Shift, 5, movetoworkspace, 5"
      "Super+Shift, 6, movetoworkspace, 6"
      "Super+Shift, 7, movetoworkspace, 7"
      "Super+Shift, 8, movetoworkspace, 8"
      "Super+Shift, 9, movetoworkspace, 9"
      "Super+Shift, 0, movetoworkspace, 10"
      
      # Special workspace & utilities
      "Super, S, togglespecialworkspace, special"
      "Super+Shift, S, global, caelestia:screenshotFreeze"
      "Super+Shift+Alt, S, global, caelestia:screenshot"
      
      # Pyprland Scratchpads
      "Super, Z, exec, pypr toggle term"  # Terminal dropdown
      "Super, N, exec, pypr toggle notes" # Notes from right
      
      # Utilities
      "Super+Shift, C, exec, hyprpicker -a"
      "Super, V, exec, pkill fuzzel || caelestia clipboard"
      "Super, Period, exec, pkill fuzzel || caelestia emoji -p"
      
      # Groups
      "Super, G, togglegroup"
      "Super+Shift, G, moveoutofgroup"
      "Super+Shift, Comma, lockactivegroup, toggle"
      
      # Workspace navigation
      "Super, mouse_down, workspace, -1"
      "Super, mouse_up, workspace, +1"
      "Super+Alt, mouse_down, movetoworkspace, -1"
      "Super+Alt, mouse_up, movetoworkspace, +1"
    ];
    
    # Lockable binds (brightness, screenshot, media, volume)
    bindl = [
      ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
      ", XF86MonBrightnessDown, global, caelestia:brightnessDown"
      ", Print, exec, caelestia screenshot"
      "Ctrl+Super, Space, global, caelestia:mediaToggle"
      ", XF86AudioPlay, global, caelestia:mediaToggle"
      ", XF86AudioPause, global, caelestia:mediaToggle"
      "Ctrl+Super, Equal, global, caelestia:mediaNext"
      ", XF86AudioNext, global, caelestia:mediaNext"
      "Ctrl+Super, Minus, global, caelestia:mediaPrev"
      ", XF86AudioPrev, global, caelestia:mediaPrev"
      ", XF86AudioStop, global, caelestia:mediaStop"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "Super+Shift, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];
    
    # Volume with repeat
    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];
    
    # Mouse binds
    bindm = [
      "Super, mouse:272, movewindow"
      "Super, mouse:273, resizewindow"
    ];
    
    # Repeat binds
    binde = [
      "Super, Minus, splitratio, -0.1"
      "Super, Equal, splitratio, 0.1"
      "Super, Page_Up, workspace, -1"
      "Super, Page_Down, workspace, +1"
      "Super+Alt, Page_Up, movetoworkspace, -1"
      "Super+Alt, Page_Down, movetoworkspace, +1"
    ];
    
    # Release binds (caelestia control)
    bindr = [
      "Ctrl+Super+Shift, R, exec, qs -c caelestia kill"
      "Ctrl+Super+Alt, R, exec, qs -c caelestia kill; caelestia shell -d"
    ];
  };
}