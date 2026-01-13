{ config, pkgs, vars, ... }:

let
  # Wrapper Package Definition
  davinciWrapper = pkgs.writeShellScriptBin "davinci-wrapper" ''
    # Fix permissions and launch DaVinci Resolve
    
    # 1. Ensure config dir exists and we are in it (Simulates normal Linux behavior)
    mkdir -p "$HOME/.local/share/DaVinciResolve/logs"
    cd "$HOME/.local/share/DaVinciResolve" || exit 1
    
    # 2. Patch the log config if it reverted to relative path (Safety net)
    if [ -f configs/log-conf.xml ]; then
      sed -i 's|\./logs/rollinglog.txt|/home/matheus/.local/share/DaVinciResolve/logs/rollinglog.txt|g' configs/log-conf.xml
    fi

    # 3. Aggressively prevent "Quick Setup" corruption
    # If config.dat exists (created by Quick Setup), we nuke it to force safe defaults.
    rm -f configs/config.dat configs/config.dat.bak

    # 4. ENVIRONMENT FIXES
    # Force XCB backend to fix "No Main Display GPU"
    export QT_QPA_PLATFORM=xcb
    
    # UNSET System Theming! (DaVinci crashes if it tries to load system GTK/Qt themes)
    unset QT_QPA_PLATFORMTHEME
    unset QT_STYLE_OVERRIDE
    export QT_STYLE_OVERRIDE=""
    
    # 5. FONT FIX
    # Force visibility of system paths for fonts
    export FONTCONFIG_FILE=/etc/fonts/fonts.conf
    # Include user local share for fonts (e.g. Excalifont)
    export XDG_DATA_DIRS="$HOME/.local/share:$XDG_DATA_DIRS:/usr/share:/run/current-system/sw/share"
    
    # 5. Launch
    exec ${pkgs.davinci-resolve}/bin/davinci-resolve "$@"
  '';
  # Desktop Entry (Robust Method)
  davinciDesktop = pkgs.makeDesktopItem {
    name = "com.blackmagicdesign.resolve"; # Shadows the original package
    desktopName = "DaVinci Resolve";       # Clean Name
    genericName = "Video Editor";
    exec = "${davinciWrapper}/bin/davinci-wrapper %U";
    terminal = false;
    icon = "com.blackmagicdesign.resolve";
    categories = [ "AudioVideo" "Video" "Graphics" ];
    mimeTypes = [ "application/x-resolveproj" ];
    startupNotify = true;
  };
in
{
  # Adiciona o wrapper E o atalho aos pacotes
  home.packages = [ 
    davinciWrapper 
    davinciDesktop
  ];
}
