{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, wrapGAppsHook3
, patchelf
, makeWrapper
, pciutils
, gtk3
, gdk-pixbuf
, cairo
, pango
, atk
, glib
, dbus
, freetype
, fontconfig
, libxcb
, libX11
, libXrender
, libXi
, libXext
, libXdamage
, libXfixes
, libXrandr
, libXcomposite
, alsa-lib
, ffmpeg
, nss
, nspr
, libpulseaudio
, libglvnd
, pipewire
, icu
, libevent
, libvpx
, libwebp
, libogg
, libtheora
, libopus
, libva
, mesa
}:

stdenv.mkDerivation rec {
  pname   = "zen-browser";
  version = "1.19.8b";

  src = fetchurl {
    url    = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
    sha256 = "12ggj481dfi9hizpah77drd5rh3y55k9yfccigb305c6zz8a5h3v";
  };

  nativeBuildInputs = [ 
    autoPatchelfHook 
    wrapGAppsHook3 
    makeWrapper
  ];

  buildInputs = [
    gtk3 gdk-pixbuf cairo pango atk glib dbus
    freetype fontconfig libxcb libX11 libXrender libXi
    libXext libXdamage libXfixes libXrandr
    libXcomposite alsa-lib nss nspr
    icu libevent ffmpeg libvpx libwebp libopus 
    libtheora libogg libva libglvnd libpulseaudio pipewire mesa
  ];

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib/zen
    cp -r ./* $out/lib/zen/
    runHook postInstall
  '';

  postFixup = ''
    rm -rf "$out/lib/zen/swiftshader"

    RUNTIME_LIBS="${lib.makeLibraryPath [
      ffmpeg
      libvpx
      libwebp
      libopus
      libtheora
      libogg
      libva
      libglvnd
      libpulseaudio
      pipewire
      mesa
    ]}"

    makeWrapper "$out/lib/zen/zen" "$out/bin/zen" \
      --prefix LD_LIBRARY_PATH : "$RUNTIME_LIBS:/run/opengl-driver/lib" \
      --set MOZ_ENABLE_WAYLAND 1 \
      --set MOZ_DBUS_REMOTE 1 \
      --set MOZ_DISABLE_RDD_SANDBOX 1 \
      --prefix PATH : "${lib.makeBinPath [ pciutils ]}" \
      --suffix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH"

    if [ -f "$out/lib/zen/browser/chrome/icons/default/default128.png" ]; then
      install -D "$out/lib/zen/browser/chrome/icons/default/default128.png" \
        "$out/share/icons/hicolor/128x128/apps/zen.png"
    fi

    mkdir -p $out/share/applications
    cat > $out/share/applications/zen.desktop <<EOF
[Desktop Entry]
Name=Zen Browser
Exec=$out/bin/zen %U
Icon=zen
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;
EOF
  '';

  meta = with lib; {
    description = "A Firefox-based browser that brings calm to the web";
    homepage    = "https://zen-browser.app";
    license     = licenses.mpl20;
    platforms   = [ "x86_64-linux" ];
    mainProgram = "zen";
  };
}
