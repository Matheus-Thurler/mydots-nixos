{ config, ... }:

{
  # Usamos mkOutOfStoreSymlink para que o Gemini CLI consiga gravar o token de login.
  # Isso evita o erro de "Read-only file system" que você encontrou.
  
  home.file.".gemini".source = config.lib.file.mkOutOfStoreSymlink "/home/matheus/mydots-nixos/modules/home/gemini/config";

  /* 
     Nota DevOps: 
     1. Certifique-se de que o caminho acima ("/home/matheus/mydots-nixos/...") 
        corresponde ao local real onde seu repositório está clonado.
     2. Como você usa persistência, garanta que a pasta do seu repositório 
        esteja em um subvolume que não seja apagado no boot.
  */
}