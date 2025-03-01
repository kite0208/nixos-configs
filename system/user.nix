{ config, pkgs, ... }:

{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
    packages = with pkgs; [
      obsidian
      bitwarden
      discord
      thunderbird
      firefox
      qutebrowser
      spotify
      blueman
      onlyoffice-desktopeditors
      nextcloud-client
      fabric-ai
      vlc
      freac
      signal-desktop
      gnome-chess
      gnuchess
      freshrss
    ];
  };
}
