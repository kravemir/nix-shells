{
  pkgs ? import <nixpkgs> {},
  writeText ? pkgs.writeText,
  stdenv ? pkgs.stdenv,
}:

let
  drvName = "pycharm-in-fhs";
  pname = "pycharm-in-fhs";

  python-3_9-fhs-env = pkgs.callPackage ./python-3.9-fhs-env.nix {};

  desktopItem = pkgs.makeDesktopItem {
    name = "PyCharm (FHS)";
    exec = pname;
    icon = "pycharm-professional";

    desktopName = "PyCharm (FHS)";
    categories = [ "Development" "IDE" ];

    startupNotify = true;
    startupWMClass = "jetbrains-pycharm";
  };
in pkgs.runCommand
  drvName
  {
    startScript = ''
      #!${pkgs.bash}/bin/bash

      ${python-3_9-fhs-env}/bin/${python-3_9-fhs-env.name} ${pkgs.jetbrains.pycharm-professional}/bin/pycharm-professional
    '';
  }
  ''
    mkdir -p $out/{bin,share/pixmaps}

    echo -n "$startScript" > $out/bin/${pname}
    chmod +x $out/bin/${pname}

    ln -s ${pkgs.jetbrains.pycharm-professional}/share/pixmaps/pycharm-professional.png $out/share/pixmaps/pycharm-professional.png
    ln -s ${desktopItem}/share/applications $out/share/applications
  ''

