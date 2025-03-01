#!/bin/bash
set -e
pushd ~/.dotfiles
echo "enter file to edit."
read file
vi $file
alejandra . &>/dev/null
git diff -U0 *.nix
echo "NixOS is rebuilding..."
sudo nixos-rebuild switch --flake . &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
