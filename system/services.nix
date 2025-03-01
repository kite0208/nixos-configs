{
  config,
  pkgs,
  ...
}: {
  # Bluetooth
  hardware.bluetooth.enable = true;

  # Fingerprint
  systemd.services.fprintd = {
    wantedBy = ["multi-user.target"];
    serviceConfig.Type = "simple";
  };
  services.fprintd.enable = true;

  # Cups
  services.printing.enable = true;

  # Garbage collection
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # USB mounting
  services.udisks2.enable = true;

  # Auto upgrade
  system.autoUpgrade = {
    enable = true;
    #    flake = "./../flake.nix";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "09:00";
    randomizedDelaySec = "45min";
  };

  virtualisation.docker.enable = true;

  # Ollama
  services.ollama.enable = true;

  # Tailscale
  services.tailscale.enable = true;
}
