nix-shells
==========

Repository contains configurations for `nix-shell` to create **virtual environment** with specific software versions.

## Usage

Basic usage:

```bash
# assuming this repository is cloned in ~/nix-shells

# enter specific shell using one of following commands
nix-shell ~/nix-shells/node-v16.12.0.nix
nix-shell ~/nix-shells/node-v16.15.0.nix

# instantiate shells to prevent GC cleaning them (or to build them in advance)
cd ~/nix-shells/ && ./instantiate-shells.sh
```

## Automatic shell loading

To automatically load a shell when entering a project directory, install `direnv` and execute following in the project directory:

```bash
# configure direnv profile to use nix
echo 'use_nix' > .envrc

# reuse shell
ln -s ~/nix-shells/node-v16.12.0.nix shell.nix

# allow direnv in current directory
direnv allow .
```

See [full docs](https://nixos.wiki/wiki/Development_environment_with_nix-shell#direnv).

# Documentation

Useful documentation used to build this and work with nix shells:

- [Development environment with nix-shell](https://nixos.wiki/wiki/Development_environment_with_nix-shell)
- [Pinning in Storage optimization](https://nixos.wiki/wiki/Storage_optimization#Pinning)
