{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    
    # Sintaxe: monitor = NOME, RESOLUCAO, POSICAO, ESCALA
    
    monitor = [
      # Exemplo: O monitor HDMI é o da ESQUERDA (Posição 0x0)
      #"HDMI-A-1, 1920x1080, 0x0, 1"

      # Exemplo: O monitor DP é o da DIREITA (Posição 1920x0)
      # Se seu monitor esquerdo for 1920 de largura, o próximo começa no pixel 1920.
      "DP-1, 1920x1080, 1920x0, 1"
      
      # Regra genérica para conectar monitores extras automaticamente
      ", preferred, auto, 1"
    ];
  };
}