#!/usr/bin/env bash

rm -rf ./.nix-gc-roots

export NIXPKGS_ALLOW_UNFREE=1

nix-instantiate ./hugo-v0.94.2.nix --indirect --add-root ./.nix-gc-roots/hugo-v0.94.2.drv
nix-instantiate ./node-v12.x.nix --indirect --add-root ./.nix-gc-roots/node-v12.x.drv
nix-instantiate ./node-v16.12.0.nix --indirect --add-root ./.nix-gc-roots/node-v16.12.0.drv
nix-instantiate ./node-v16.15.0.nix --indirect --add-root ./.nix-gc-roots/node-v16.15.0.drv

nix-shell ./hugo-v0.94.2.nix --run 'hugo version && echo'
nix-shell ./node-v12.x.nix --run 'node --version && npm --version && echo'
nix-shell ./node-v16.12.0.nix --run 'node --version && npm --version && echo'
nix-shell ./node-v16.15.0.nix --run 'node --version && npm --version && echo'

nix-build tools.nix -o tools

echo
echo Symlinked tools:
find "$(pwd)/tools/"
