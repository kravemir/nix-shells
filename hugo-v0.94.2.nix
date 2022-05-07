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

    vendorSha256 = "sha256:0hykczsjdgq74d6kx97z3ziaign4ic7vc3airsvnykkdfdl2qmqg";
    doCheck = false;
    runVend = true;

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
