{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
    
    settings = {
      # Font Config
      font_family = "JetBrainsMono Nerd Font";
      font_size = "12";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Window Layout
      window_padding_width = 10;
      placement_strategy = "center";
      
      # Compatibility
      # Forces 'xterm-256color' to avoid 'unknown terminal' errors 
      # on remote servers or reduced environments.
      term = "xterm-256color"; 

      # Mouse
      # Disables clicking links with plain left click (requires ctrl+click)
      # to avoid accidental opens.
      mouse_map_left_click = "ungrabbed";
    };

    # Shell Integration
    shellIntegration.enableZshIntegration = true;
  };
}
