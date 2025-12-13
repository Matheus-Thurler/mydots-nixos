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
      rebuild = "sudo nixos-rebuild switch --flake /home/matheus/mydots-nixos#nixos";
      update = "nix flake update --flake /home/matheus/mydots-nixos && sudo nixos-rebuild switch --flake /home/matheus/mydots-nixos#nixos";
      
      k = "kubectl";
      ctx = "kubectx";
      ns = "kubens";
      
      py = "nohup /home/matheus/.local/share/JetBrains/Toolbox/apps/pycharm-professional/bin/pycharm.sh > /dev/null 2>&1 &";
      webcam = "nohup scrcpy --v4l2-sink=/dev/video4 --camera-size=3840x2160 --capture-orientation=180 --capture-orientation=flip180 --video-source=camera --no-playback > /dev/null 2>&1 &";
      killwebcam = "pkill -f 'scrcpy.*v4l2-sink'";
    };

    # (Mantenha o bloco initExtra igual estava...)
    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      export KUBE_EDITOR="nano"
      export PATH="$PATH:$(go env GOPATH)/bin"
      
      hugo() {
        hvm_show_status=true
        if hugo_bin=$(hvm status --printExecPathCached 2>/dev/null); then
          if [ "''${hvm_show_status}" = "true" ]; then
            >&2 printf "Hugo version management is enabled in this directory.\\n"
          fi
        else
          if ! hugo_bin=$(command -v hugo); then
            >&2 printf "Command not found: hugo\\n"
            return 1
          fi
        fi
        "''${hugo_bin}" "$@"
      }
    '';
  };
}