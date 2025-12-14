{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;
    font = "FiraCode Nerd Font 14";
    
    extraConfig = {
      show-icons = true;
      display-drun = " ";
      drun-display-format = "{name}";
    };
  };
}
