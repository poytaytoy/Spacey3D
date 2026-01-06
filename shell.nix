{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    openjdk11
    maven
    libGL
    glib
    gtk3
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    pango
    cairo
    atk
    gdk-pixbuf
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath (with pkgs; [
      libGL
      glib
      gtk3
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXtst
      xorg.libXi
      pango
      cairo
      atk
      gdk-pixbuf
    ])}"
    echo "Spacey3D Dev Environment Loaded (JDK 11)"
  '';
}