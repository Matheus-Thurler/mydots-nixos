{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$ipc" = "noctalia-shell ipc call";
    
    "exec-once" = [
      "noctalia-shell"
      "hyprctl setcursor Yaru 24"
    ];

    # Estética da Janela para Noctalia
    general = {
      gaps_in = 3;
      gaps_out = 8;
      border_size = 1;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };

    decoration = {
      rounding = 5;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };
    };

    bind = [
      # Binds Core da Noctalia
      "SUPER, SPACE, exec, $ipc launcher toggle"
      "SUPER, S, exec, $ipc controlCenter toggle"
      "SUPER, comma, exec, $ipc settings toggle"
      "SUPER SHIFT, R, exec, pkill quickshell; sleep 0.5; noctalia-shell"
      "SUPER, R, exec, $ipc launcher toggle"

      # Aplicativos e Atalhos Customizados
      "SUPER, Return, exec, kitty"
      "SUPER, Q, killactive,"
      "SUPER, W, exec, google-chrome-stable"
      "SUPER, C, exec, dolphin"
      "SUPER, M, exit,"
      "SUPER, V, togglefloating,"
      "SUPER, E, exec, dolphin"

      # Workspaces
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, $ipc volume increase"
      ", XF86AudioLowerVolume, exec, $ipc volume decrease"
      ", XF86MonBrightnessUp, exec, $ipc brightness increase"
      ", XF86MonBrightnessDown, exec, $ipc brightness decrease"
    ];

    bindl = [
      ", XF86AudioMute, exec, $ipc volume muteOutput"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
