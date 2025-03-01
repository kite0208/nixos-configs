set -e
pushd ~/.dotfiles
git add flake.nix
git add system/
git add user/
git diff -U0
echo "NixOS is rebuilding..."
sudo nixos-rebuild switch --flake . && home-manager switch --flake . &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
