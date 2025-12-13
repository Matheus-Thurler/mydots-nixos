{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # Você pode descomentar e adicionar extensões aqui depois
    # extensions = with pkgs.vscode-extensions; [ ];
  };
}