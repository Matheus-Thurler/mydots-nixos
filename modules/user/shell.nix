{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "web-search" "kubectl" ];
      theme = "robbyrussell"; 
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    shellAliases = {
      ll = "ls -l";
      
      # --- CORREÇÃO AQUI ---
      # Usamos o caminho absoluto /home/matheus/mydots-nixos
      # Assim o comando funciona mesmo se você estiver na pasta de Downloads ou /tmp
      rebuild = "sudo nixos-rebuild switch --flake /home/matheus/mydots-nixos#nixos --impure";
      update = "nix flake update --flake /home/matheus/mydots-nixos && sudo nixos-rebuild switch --flake /home/matheus/mydots-nixos#nixos --impure";
      
      k = "kubectl";
      ctx = "kubectx";
      ns = "kubens";
      hugo = "/etc/profiles/per-user/matheus/bin/hugo";
      
      py = "nohup /home/matheus/.local/share/JetBrains/Toolbox/apps/pycharm-professional/bin/pycharm.sh > /dev/null 2>&1 &";
      webcam = "nohup scrcpy --v4l2-sink=/dev/video4 --camera-size=3840x2160 --capture-orientation=180 --capture-orientation=flip180 --video-source=camera --no-playback > /dev/null 2>&1 &";
      killwebcam = "pkill -f 'scrcpy.*v4l2-sink'";
      
      # Fix DaVinci Resolve automatically
      davinci-resolve = "davinci-wrapper";
    };

    # (Mantenha o bloco initExtra igual estava...)
    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      export KUBE_EDITOR="nano"
      export PATH="$PATH:$(go env GOPATH)/bin"
    '';
  };
}