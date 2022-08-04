{ pkgs ? import <nixpkgs> {} }:
let
  buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {
      python = pkgs.python38;
  };
in rec {
  nodejs-16_12_0 = buildNodejs {
    enableNpm = true;
    version = "16.12.0";
    sha256 = "5f620a6a400901a6565aa0c07309cde3aab3dbaa765cecb934241de520d36bac";
  };
  nodejs-16_15_0 = buildNodejs {
    enableNpm = true;
    version = "16.15.0";
    sha256 = "1xx4drj3rc6kin60bm84f3wnnplglih7k588r8g34y1zqkpi5y50";
  };
}
