{ pkgs, lib, ... }:

let
  # Antigravity CLI (terminal / agy)
  antigravity-cli = pkgs.stdenv.mkDerivation rec {
    pname = "antigravity-cli";
    version = "1.0.0";

    src = pkgs.fetchurl {
      url = "https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.0-5288553236791296/linux-x64/cli_linux_x64.tar.gz";
      sha256 = "1dlyx6vpzw0zsl50v0hwrrsx88jf65bq0g2ddjhc9bsgax0662bh";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/bin
      cp antigravity $out/bin/agy
      ln -s $out/bin/agy $out/bin/antigravity
    '';

    meta = with pkgs.lib; {
      description = "Antigravity CLI - A multi-agent orchestration tool";
      homepage = "https://antigravity.google";
      license = licenses.unfree;
      platforms = platforms.linux;
    };
  };

  # Antigravity Hub 2.0.1 (app Electron/GUI)
  antigravity-hub = pkgs.stdenv.mkDerivation rec {
    pname = "antigravity-hub";
    version = "2.0.1";

    src = pkgs.fetchurl {
      url = "https://storage.googleapis.com/antigravity-public/antigravity-hub/2.0.1-6566078776737792/linux-x64/Antigravity.tar.gz";
      hash = "sha256-Byfh9WlhttI0eUHyeNppzGwX3jvv6YhSSEjNFnOA6as=";
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
      pkgs.makeWrapper
    ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      libGL
      libglvnd
      mesa
      nss
      nspr
      atk
      at-spi2-atk
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxcb
      libxkbcommon
      expat
      alsa-lib
      cups
      dbus
      glib
      gtk3
      pango
      cairo
      gdk-pixbuf
    ];

    sourceRoot = "Antigravity-x64";

    installPhase = ''
      mkdir -p $out/opt/antigravity-hub $out/bin

      # Copiar todos os arquivos do Electron
      cp -r . $out/opt/antigravity-hub/

      # Garantir permissão SUID no chrome-sandbox
      chmod 4755 $out/opt/antigravity-hub/chrome-sandbox || true

      # Wrapper com LD_LIBRARY_PATH para EGL/Mesa no NixOS
      makeWrapper $out/opt/antigravity-hub/antigravity $out/bin/antigravity-hub \
        --prefix LD_LIBRARY_PATH : "${pkgs.mesa}/lib:${pkgs.mesa.drivers}/lib:${pkgs.libglvnd}/lib:${pkgs.libGL}/lib" \
        --add-flags "--ozone-platform-hint=auto"
    '';

    meta = with pkgs.lib; {
      description = "Antigravity Hub - GUI app for multi-agent orchestration";
      homepage = "https://antigravity.google";
      license = licenses.unfree;
      platforms = platforms.linux;
    };
  };
in
{
  home.packages = [
    antigravity-cli
    antigravity-hub
  ];
}
