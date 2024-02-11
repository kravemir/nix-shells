{
  pkgs ? import <nixpkgs> {},
}:

let
  python-3_9-fhs-env = pkgs.callPackage ./python-3.9-fhs-env.nix {};
in
python-3_9-fhs-env.env
