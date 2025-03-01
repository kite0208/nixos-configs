set -e
pushd ~/.dotfiles
git diff -U0 flake.nix
git diff -U0 system/
git diff -U0 user/
echo "NixOS is rebuilding..."
sudo nixos-rebuild switch --flake . && home-manager switch --flake . &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
