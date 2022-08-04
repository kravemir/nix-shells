{ pkgs ? import <nixpkgs> {} }:
let
  cpkgs = pkgs.callPackage ./tools-base.nix {};
in pkgs.mkShell rec {
  name = "webdev-node-16.15.0";

  buildInputs = with pkgs; [
    python3
    cpkgs.nodejs-16_15_0
  ];
}
