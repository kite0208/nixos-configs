{
  pkgs,
  config,
  ...
}: {
  gtk.enable = true;

  gtk.theme.package = pkgs.gruvbox-dark-gtk;
  gtk.theme.name = "gruvbox-dark";
}
