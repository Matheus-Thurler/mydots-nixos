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
      
      # Instala Oh-My-Gemini se não existir
      if [ ! -d "$HOME/.gemini/extensions/oh-my-gemini" ]; then
        echo "Installing Gemini oh-my-gemini extension..."
        gemini extensions install https://github.com/r3dlex/oh-my-gemini --consent --skip-settings || true
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