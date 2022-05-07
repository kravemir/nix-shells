#!/usr/bin/env bash

rm -rf ./.nix-gc-roots

nix-shell ./hugo-v0.94.2.nix --run 'hugo version && echo'
nix-shell ./node-v16.12.0.nix --run 'node --version && npm --version && echo'

nix-instantiate ./hugo-v0.94.2.nix --indirect --add-root ./.nix-gc-roots/hugo-v0.94.2.drv
nix-instantiate ./node-v16.12.0.nix --indirect --add-root ./.nix-gc-roots/node-v16.12.0.drv
