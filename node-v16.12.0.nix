let pkgs = import <nixpkgs> {};

    buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {
        python = pkgs.python38;
    };
    
    nodejs-16_12_0 = buildNodejs {
      enableNpm = true;
      version = "16.12.0";
      sha256 = "5f620a6a400901a6565aa0c07309cde3aab3dbaa765cecb934241de520d36bac";
    };

in pkgs.mkShell rec {
  name = "webdev-node-16.12.0";
  
  buildInputs = with pkgs; [
    python3
    nodejs-16_12_0
  ];
}
