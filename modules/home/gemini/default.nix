{ config, pkgs, ... }:

{
  # Symlink da pasta de configuração para ~/.gemini
  # Isso permite que você edite os arquivos em modules/home/gemini/config/ 
  # e eles sejam refletidos em ~/.gemini/ via Home Manager.
  home.file.".gemini".source = ./config;
  home.file.".gemini".recursive = true;
}
