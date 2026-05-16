{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      # Shell padrão para o Kitty
      shell = "${pkgs.fish}/bin/fish";

      # Evita 'xterm-kitty': unknown terminal type em hosts remotos
      term = "xterm-256color";

      # Efeito de rastro no cursor (Kitty 0.35+)
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;

      # Estilo do cursor
      cursor_shape = "block";
      cursor_blink_interval = 0;

      # Transparência removida
      background_opacity = "1.0";
      background_blur = 0;

      # Janela e Padding
      window_padding_width = 15;
      confirm_os_window_close = 0;

      # Cores base
      enable_audio_bell = false;
      mouse_hide_wait = "3.0";
    };
  };
}
