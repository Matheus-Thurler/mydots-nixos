{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    
    # Sintaxe: monitor = NOME, RESOLUCAO, POSICAO, ESCALA
    
    monitor = [
      # Exemplo: O monitor HDMI é o da ESQUERDA (Posição 0x0)
      #"HDMI-A-1, 1920x1080, 0x0, 1"

      # DP-1 (Principal, Esquerda, 1080p @ 240Hz)
      "DP-1, 1920x1080@240, 0x0, 1"

      # HDMI-A-1 (Direita, 1080p, Forçando 75Hz)
      "HDMI-A-1, 1920x1080@75, 1920x0, 1"

      # Regra genérica (Volta para preferred para priorizar resolução em outros monitores)
      ", preferred, auto, 1"
    ];
  };
}