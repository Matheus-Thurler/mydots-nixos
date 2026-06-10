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

  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "intl";
    };

    monitor = [
      "DP-2, 1920x1080@240, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, 1920x0, 1"
    ];

    workspace = [
      "1, monitor:DP-2, default:true"
      "2, monitor:DP-2"
      "3, monitor:DP-2"
      "4, monitor:DP-2"
      "5, monitor:DP-2"
      "6, monitor:HDMI-A-1, default:true"
      "7, monitor:HDMI-A-1"
      "8, monitor:HDMI-A-1"
      "9, monitor:HDMI-A-1"
      "10, monitor:HDMI-A-1"
    ];
  };
}
