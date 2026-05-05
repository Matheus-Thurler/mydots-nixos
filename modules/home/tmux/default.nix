{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    newSession = true;
    terminal = "screen-256color";
  };
}
