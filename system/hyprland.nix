{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  security.pam.services.hyprlock = {};
  environment.systemPackages = with pkgs; [
    hyprlock
    pcmanfm
    wofi
    waybar
    dunst
    swww
    lxsession
    hyprshot
    networkmanagerapplet
    wl-clipboard
  ];
}
