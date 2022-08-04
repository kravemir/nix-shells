let pkgs = import <nixpkgs> {};
in pkgs.mkShell rec {
  name = "webdev-node-12.x";

  buildInputs = with pkgs; [
    python3
    nodejs-12_x
    zlib
  ];
}
