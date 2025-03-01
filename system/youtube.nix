{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    davinci-resolve
    obs-studio
  ];
}
