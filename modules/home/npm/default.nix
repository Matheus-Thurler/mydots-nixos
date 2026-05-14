{ config, pkgs, ... }:

let
  npmDir = "${config.home.homeDirectory}/.npm-global";
in
{
  home.sessionVariables = {
    NPM_CONFIG_PREFIX = npmDir;
  };

  home.sessionPath = [ "${npmDir}/bin" ];

  home.file.".npmrc".text = ''
    prefix = ${npmDir}
  '';

  home.activation.createNpmGlobalDir = {
    after = [ "writeBoundary" ];
    before = [ ];
    data = ''
      if [ ! -d "${npmDir}" ]; then
        mkdir -p "${npmDir}"
      fi
    '';
  };
}
