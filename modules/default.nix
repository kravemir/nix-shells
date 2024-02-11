{ pkgs ? import <nixpkgs> {} }:

with pkgs;

{
  fhs-etc = callPackage ./fhs-etc.nix { };
}
