{ config, lib, pkgs, ... }:

{
  # Usamos mkOutOfStoreSymlink para que o Gemini CLI consiga gravar o token de login.
  # Isso evita o erro de "Read-only file system" que você encontrou.
  
  home.file.".gemini".source = config.lib.file.mkOutOfStoreSymlink "/home/matheus/mydots-nixos/modules/home/gemini/config";

  # Automação para instalar extensões caso não existam
  home.activation.installGeminiExtensions = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # Verifica se o binário do gemini está disponível
    if command -v gemini &> /dev/null; then
      # Instala Caveman se não existir
      if [ ! -d "$HOME/.gemini/extensions/caveman" ]; then
        echo "Installing Gemini caveman extension..."
        gemini extensions install https://github.com/JuliusBrussee/caveman --consent --skip-settings || true
      fi
      
      # FIX: Remove invalid YAML-like frontmatter (---) from caveman-init.toml that breaks TOML parsing
      CAVEMAN_INIT="$HOME/.gemini/extensions/caveman/commands/caveman-init.toml"
      if grep -q "^---$" "$CAVEMAN_INIT" 2>/dev/null; then
        sed -i '/^---$/d' "$CAVEMAN_INIT"
        echo "Patched caveman-init.toml to remove invalid TOML frontmatter."
      fi
      
      # Instala Oh-My-Gemini se não existir
      if [ ! -d "$HOME/.gemini/extensions/oh-my-gemini" ]; then
        echo "Installing Gemini oh-my-gemini extension..."
        gemini extensions install https://github.com/r3dlex/oh-my-gemini --non-interactive || true
      fi

      # Garante o link simbólico do binário oh-my-gemini no PATH
      OMG_BIN_DIR="$HOME/.npm-global/bin"
      OMG_SOURCE="$HOME/.gemini/extensions/oh-my-gemini/dist/cli/index.js"

      if [ -f "$OMG_SOURCE" ]; then
        mkdir -p "$OMG_BIN_DIR"
        chmod +x "$OMG_SOURCE"
        ln -sf "$OMG_SOURCE" "$OMG_BIN_DIR/oh-my-gemini"
        ln -sf "$OMG_SOURCE" "$OMG_BIN_DIR/omg"
        echo "Linked oh-my-gemini binaries to $OMG_BIN_DIR"
      fi
    fi
  '';


  /* 
     Nota DevOps: 
     1. Certifique-se de que o caminho acima ("/home/matheus/mydots-nixos/...") 
        corresponde ao local real onde seu repositório está clonado.
     2. Como você usa persistência, garanta que a pasta do seu repositório 
        esteja em um subvolume que não seja apagado no boot.
  */
}