set -e
pushd ~/.dotfiles
git add *.nix
echo "NixOS is rebuilding..."
sudo nixos-rebuild switch --flake . && home-manager switch --flake . &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
