{ pkgs ? import <nixpkgs> {} }:
let
  cpkgs = pkgs.callPackage ./tools-base.nix {};
in pkgs.runCommand "tools" {
  buildInputs = with pkgs; [
    nodejs-16_x
    cpkgs.nodejs-16_12_0
    cpkgs.nodejs-16_15_0
    python39
    python311
  ];
} ''
mkdir -p $out/nodejs
ln -s ${pkgs.nodejs-16_x} $out/nodejs/16.x
ln -s ${cpkgs.nodejs-16_12_0} $out/nodejs/16.12.0
ln -s ${cpkgs.nodejs-16_15_0} $out/nodejs/16.15.0

mkdir -p $out/python
ln -s ${pkgs.python39} $out/python/3.9
ln -s ${pkgs.python311} $out/python/3.11
''
