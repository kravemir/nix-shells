let
  pkgs = import <nixpkgs> {};


#  old-pkgs = import (builtins.fetchGit {
#    name = "node-js-old-revisions";
#    url = "https://github.com/NixOS/nixpkgs/";
#    ref = "refs/heads/nixpkgs-unstable";
#    rev = "ff8b619cfecb98bb94ae49ca7ceca937923a75fa";
#  }) {};

  old-pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/ff8b619cfecb98bb94ae49ca7ceca937923a75fa.tar.gz";
  }) {};
in pkgs.mkShell rec {
  name = "webdev-node-12.x";

  buildInputs = with pkgs; [
    old-pkgs.nodejs-12_x

    python3

    autoconf
    automake
    glibc
    libpng
    libtool
    mozjpeg
    nasm
    optipng
    pkg-config
    zlib
  ];

  # workaround for npm dep compilation
  # https://github.com/imagemin/optipng-bin/issues/108
  shellHook = ''
    LD=$CC
  '';
}
