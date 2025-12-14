{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;
    font = "JetBrainsMono Nerd Font 14";
  };
}
