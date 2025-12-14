{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      # --- Basic Actions ---
      "$mod, Q, killactive,"
      "$mod, W, exec, google-chrome-stable"
      "$mod, P, exec, spotify"
      "$mod, D, exec, discord"
      "$mod, M, exit,"
      "$mod, V, togglefloating,"
      "$mod, F, fullscreen,"
      "$mod, RETURN, exec, kitty" # Standard Terminal
      "$mod, E, exec, thunar"
      "$mod, R, exec, rofi -show drun"
      
      # Help / Keybinds
      "$mod, I, exec, show-keybinds"
      
      # Audio Control (Media Keys)
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, pamixer --default-source -t"
      
      # Media Control
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"

      # Screenshot (Select region -> Clipboard)
      "$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"
      
      # Wallpaper Selector
      "$mod SHIFT, W, exec, wallpaper-selector"

      # Lock Screen
      "$mod, L, exec, hyprlock"


      # --- Window Focus (Arrows) ---
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # --- Workspaces (1-10) ---
      # Switch to workspace
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Move active window to workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      
      # Special Workspace (Scratchpad)
      # "$mod, S, togglespecialworkspace, magic"
      # "$mod SHIFT, S, movetoworkspace, special:magic"
      
      # Mouse Scroll Workspaces
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
    ];

    # Mouse move/resize
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    # Key release action (Super Key -> Menu)
    bindr = [
      "SUPER, SUPER_L, exec, rofi -show drun"
    ];
  };
}