{ config, pkgs, ... }:

{
  musnix.enable = true;
  musnix.rtirq.enable = true;

  environment.systemPackages = with pkgs; [
    ardour
    qjackctl
    calf
    tap-plugins
    lsp-plugins
    x42-plugins
    distrho-ports
    neural-amp-modeler-lv2
    carla
  ];
}
