{ config, pkgs, ... }:

{
  # Pacotes auxiliares para uma experiência completa
  home.packages = with pkgs; [
    waybar        # A barra superior
    dunst         # Notificações
    rofi  # Menu de aplicativos (Launcher)
    swww          # Wallpaper
    networkmanagerapplet # Ícone de wi-fi na barra
    xfce.thunar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    
    # Aqui traduzimos o hyprland.conf para Nix
    settings = {
      
      # --- MONITORES ---
      # Sintaxe: "monitor,resolucao,posicao,escala"
      monitor = ",preferred,auto,1";

      # --- INPUT / TECLADO ---
      input = {
        kb_layout = "us";        # ou "us"
        kb_variant = "intl";         # ou "intl" se for US International
        kb_options = "grp:alt_shift_toggle"; 
        
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      # --- GERAL ---
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        
        layout = "dwindle"; # O layout padrão do Hyprland
      };

      # --- DECORAÇÃO (Beleza) ---
      decoration = {
        rounding = 10;
        
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
        };
      };

      # --- ATALHOS (BINDINGS) ---
      "$mod" = "SUPER"; # Tecla Windows

      bind = [
        "$mod, T, exec, kitty"          # Abrir terminal
        "$mod, Q, killactive,"          # Fechar janela
        "$mod, M, exit,"                # Sair do Hyprland
        "$mod, E, exec, thunar"        # File Manager (troque pelo seu)
        "$mod, V, togglefloating,"      # Flutuar janela
        "$mod, R, exec, rofi -show drun" # Menu de Apps
        
        # Mover foco com setas ou vim keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ];
      
      # Atalhos de mouse para mover/redimensionar janelas
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}