let pkgs = import <nixpkgs> {};

    buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {
        python = pkgs.python38;
    };

    nodejs-16_15_0 = buildNodejs {
      enableNpm = true;
      version = "16.15.0";
      sha256 = "1xx4drj3rc6kin60bm84f3wnnplglih7k588r8g34y1zqkpi5y50";
    };

in pkgs.mkShell rec {
  name = "webdev-node-16.15.0";

  buildInputs = with pkgs; [
    python3
    nodejs-16_15_0
  ];
}
