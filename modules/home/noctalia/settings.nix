{ ... }:

{
  programs.noctalia-shell.settings = {
    colorSchemes = {
      predefinedScheme = "GitHub Dark";
      darkMode = true;
      useWallpaperColors = false;
      generationMethod = "monochrome";
    };

    general = {
      fontDefault = "JetBrains Mono";
      language = "pt-BR";
    };

    bar = {
      position = "top";
      displayMode = "always_visible";
      
      # LISTA DE WIDGETS DA BARRA
      widgets = {
        # LADO ESQUERDO: Launcher e Relógio
        left = [
          {
            id = "Launcher";
            useDistroLogo = true; # ÍCONE DO NIXOS
            icon = "rocket";      # Fallback se o logo falhar
          }
          {
            id = "Clock";
            formatHorizontal = "HH:mm ddd, MMM dd";
          }
          {
            id = "SystemMonitor";
            compactMode = true;
          }
        ];

        # CENTRO: Workspaces Monocromáticos
        center = [
          {
            id = "Workspace";
            rainbow = false;
            showLabels = true;
            focusedColor = "primary";
            occupiedColor = "secondary";
            emptyColor = "outline";
            pillSize = 0.6;
          }
        ];

        # LADO DIREITO: Sistema, Áudio, Bateria e Control Center
        right = [
          {
            id = "Tray";
          }
          {
            id = "Volume";
          }
          {
            id = "Battery";
          }
          {
            id = "ControlCenter";
          }
        ];
      };
    };

    dock = {
      enabled = true;
      position = "bottom";
      displayMode = "auto_hide";
    };

    ui = {
      fontFixed = "monospace";
      panelsAttachedToBar = true;
    };
  };
}
