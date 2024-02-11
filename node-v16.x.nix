{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell rec {
  name = "webdev-node-16.x";

  buildInputs = with pkgs; [
    nodejs-16_x

    nodePackages.npm
  ];
}
