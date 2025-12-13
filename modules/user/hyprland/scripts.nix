{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Scripts Customizados
    (writeShellScriptBin "show-keybinds" ''
      echo -e "  Keybinds\n
      SUPER + Enter    Terminal Quake (Drop-down)
      SUPER + T        Terminal (Kitty)
      SUPER + R        Menu de Apps (Rofi)
      SUPER + E        Arquivos (Thunar)
      SUPER + Q        Fechar Janela
      SUPER + F        Tela Cheia
      SUPER + V        Flutuar Janela
      SUPER + S        Scratchpad (Special Workspace)
      SUPER + Setas    Mover Foco
      SUPER + 1-6      Mudar Workspace
      SUPER + SHIFT + 1-6  Mover Janela para Workspace
      SUPER + M        Sair do Hyprland (Logout)
      SUPER + I        Ver esta lista" | rofi -dmenu -i -p "Atalhos"
    '')
  ];
}
