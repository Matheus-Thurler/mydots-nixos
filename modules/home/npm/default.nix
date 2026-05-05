{ config, pkgs, ... }:

{
  # Configura o npm para usar uma pasta no diretório home para pacotes globais.
  # Isso evita a necessidade de sudo para instalar pacotes npm globais.
  
  home.sessionPath = [
    "/home/matheus/.npm-global/bin"
  ];

  home.file.".npmrc".text = ''
    prefix = /home/matheus/.npm-global
  '';

  # Garante que a pasta exista
  home.activation.createNpmGlobalDir = {
    after = [ "writeBoundary" ];
    before = [ ];
    data = ''
      if [ ! -d "/home/matheus/.npm-global" ]; then
        mkdir -p "/home/matheus/.npm-global"
      fi
    '';
  };
}
