{ pkgs, ... }:

let
  gemini-launcher = pkgs.writeShellScriptBin "gemini" ''
    if [ ! -f "$HOME/.npm-global/bin/gemini" ]; then
      echo "Primeira execução: Instalando Gemini CLI localmente..."
      ${pkgs.nodejs_24}/bin/npm install -g @google/gemini-cli --prefix="$HOME/.npm-global" --no-audit --no-fund
    fi
    exec "$HOME/.npm-global/bin/gemini" "$@"
  '';
in
{
  home.packages = [ gemini-launcher ];
}
