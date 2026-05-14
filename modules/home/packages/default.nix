{ pkgs, ... }:

let
  pythonCs = pkgs.python313Packages.buildPythonPackage rec {
    pname = "cs";
    version = "3.2.0";
    src = pkgs.python313Packages.fetchPypi {
      inherit pname version;
      hash = "sha256-wtqF19/xFKhn/rVvvrnnverx7miDU1ziMZiK0gCjpm4=";
    };
    pyproject = true;
    nativeBuildInputs = [ pkgs.python313Packages.setuptools pkgs.python313Packages.wheel ];
    postPatch = ''sed -i '/pytest-runner/d' setup.cfg setup.py || true'';
    propagatedBuildInputs = [ pkgs.python313Packages.requests pkgs.python313Packages.pytz ];
    doCheck = false;
  };

  pythonWithCs = pkgs.python313.withPackages (ps: [ pythonCs ]);
in
{
  imports = [
    ./cloudmonkey.nix
  ];

  home.packages = with pkgs; [
    # GUI Apps
    google-chrome
    vscode
    spotify
    discord
    slack
    obsidian
    thunar
    vlc
    localsend
    bitwarden-desktop
    antigravity
    playerctl
    winbox
    anki
    # CLI Tools
    json-diff 
    kitty     
    yaru-theme
    grim        
    slurp       
    swappy      
    wl-clipboard
    htop
    btop
    ripgrep
    jq
    fzf
    fastfetch
    tree
    dnsutils
    p7zip
    curl
    wget
    cloudmonkey
    gnumake
    # Kubernetes e Cloud
    kubectl
    kubectx
    kind
    google-cloud-sdk
    gh
    pavucontrol
    teams-for-linux
    # Desenvolvimento e Infra
    nodejs_24
    hugo
    pythonWithCs
    terraform
    go
    ansible
    distrobox
    distroshelf
    gcc 
    # Games
    steam
  ];
}
