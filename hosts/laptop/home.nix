{ config, pkgs, inputs, ... }:

{
  home.username = "matheus";
  home.homeDirectory = "/home/matheus";
  home.stateVersion = "25.11";

  imports = [
    ../../modules/home/noctalia
    ../../modules/home/hyprland
    ../../modules/home/packages
    ../../modules/home/shell
    ../../modules/home/ssh
    ../../modules/home/terminal
    ../../modules/home/git
    ../../modules/home/neovim
    ../../modules/home/tmux
    ../../modules/home/npm
    ../../modules/home/claude
    ../../modules/home/gemini
    ../../modules/home/antigravity
  ];

  programs.home-manager.enable = true;
}
