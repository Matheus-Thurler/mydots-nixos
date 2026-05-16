{ pkgs, ... }:

let
  claude-launcher = pkgs.writeShellScriptBin "claude" ''
    if [ ! -f "$HOME/.npm-global/bin/claude" ]; then
      echo "Primeira execução: Instalando Claude Code localmente..."
      ${pkgs.nodejs_24}/bin/npm install -g @anthropic-ai/claude-code --prefix="$HOME/.npm-global" --no-audit --no-fund
    fi
    exec "$HOME/.npm-global/bin/claude" "$@"
  '';
in
{
  home.packages = [
    pkgs.uv
    pkgs.claude-code-acp
    claude-launcher
  ];
}
