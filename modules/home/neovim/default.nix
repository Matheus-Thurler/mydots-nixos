{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    # Silenciar avisos do HM Unstable
    withRuby = false;
    withPython3 = false;
  };
}
