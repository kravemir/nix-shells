{
  pkgs ? import <nixpkgs> {},
  writeText ? pkgs.writeText,
  stdenv ? pkgs.stdenv,
}:

let
  inputrc = (<nixpkgs> + "/nixos/modules/programs/bash/inputrc");

  bashrc = writeText "bashrc" ''
    eval "$(starship init bash)"

    # Check whether we're running a version of Bash that has support for
    # programmable completion. If we do, enable all modules installed in
    # the system and user profile in obsolete /etc/bash_completion.d/
    # directories. Bash loads completions in all
    # $XDG_DATA_DIRS/bash-completion/completions/
    # on demand, so they do not need to be sourced here.
    if shopt -q progcomp &>/dev/null; then
      . "${pkgs.bash-completion}/etc/profile.d/bash_completion.sh"
      nullglobStatus=$(shopt -p nullglob)
      shopt -s nullglob
      for p in $NIX_PROFILES; do
        for m in "$p/etc/bash_completion.d/"*; do
          . "$m"
        done
      done
      eval "$nullglobStatus"
      unset nullglobStatus p m
    fi
  '';

# Compose /etc for the chroot environment
in stdenv.mkDerivation {
  name = "fhs-chrootenv-quality-of-life-etc";

  buildCommand = ''
    mkdir -p $out/etc
    cd $out/etc

    # shell config
    ln -s ${bashrc} bashrc
    ln -s ${inputrc} inputrc
  '';
}
