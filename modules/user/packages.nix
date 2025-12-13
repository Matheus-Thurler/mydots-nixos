{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    btop
    ripgrep
    jq
    fzf
    fastfetch # Opcional: pra mostrar infos do sistema bonitinho
  ];
}