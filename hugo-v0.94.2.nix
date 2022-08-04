let
  pkgs = import <nixpkgs> {};

  hugo-0_98_0 = pkgs.buildGoModule {
    name = "hugo";
    version = "0.94.2";

    src = pkgs.fetchFromGitHub {
      owner = "gohugoio";
      repo = "hugo";
      rev = "v0.94.2";
      sha256 = "sha256:1pdahyw0addlyl1nq6igbnrvwbkqriy7w1nwhkiz0apj2gi70l3w";
    };

    vendorSha256 = "sha256-cjpvHIqF106HfNH//ugGkhKLc3k5oT8lAviGPpKKoro=";
    doCheck = false;
    proxyVendor = true;

    tags = [ "extended" ];

    nativeBuildInputs = [ pkgs.installShellFiles ];

    postInstall = ''
      $out/bin/hugo gen man
      installManPage man/*
      installShellCompletion --cmd hugo \
        --bash <($out/bin/hugo gen autocomplete --type=bash) \
        --fish <($out/bin/hugo gen autocomplete --type=fish) \
        --zsh <($out/bin/hugo gen autocomplete --type=zsh)
    '';
  };

in pkgs.mkShell rec {
  name = "hugo-0.94.2";

  buildInputs = with pkgs; [
    hugo-0_98_0
  ];
}
