{ ... }:

{
  # Configuração de Widgets de Área de Trabalho (Estilo Desktop Widgets)
  programs.noctalia-shell.settings.desktopWidgets = {
    enabled = false; # Altere para true para habilitar
    overviewEnabled = true;
    gridSnap = true;
    gridSnapScale = false;
    
    # Lista de widgets e suas posições
    monitorWidgets = [
      # Exemplo de um relógio flutuante:
      # {
      #   id = "Clock";
      #   x = 100;
      #   y = 100;
      #   scale = 1.0;
      # }
    ];
  };
}
