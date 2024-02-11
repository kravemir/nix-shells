{
  pkgs ? import <nixpkgs> {},
  writeText ? pkgs.writeText,
  stdenv ? pkgs.stdenv,
}:

let
  modules = pkgs.callPackage ./modules {};
in
(pkgs.buildFHSUserEnv {
  name = "python-3.9-fhs-env";

  targetPkgs = pkgs: (with pkgs; [
    starship
    bash-completion
    bashInteractive

    gnumake
    pkg-config

    python39
    python39Packages.pip
    python39Packages.poetry
    python39Packages.virtualenv

    musl

    libmysqlclient
    libmysqlclient.dev
    libtool
    libxml2
    libxml2.dev
    libxslt
    libxslt.dev
    xmlsec
    xmlsec.dev
    zlib
    zlib.dev

    modules.fhs-etc
  ]);
})
