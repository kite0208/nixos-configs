{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "user";
  home.homeDirectory = "/home/user";

  fonts.fontconfig.enable = true;

  # Automounting usb-devices
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.pcmanfm}/bin/pcmanfm";
      };
    };
  };

  # Git setup
  programs.git = {
    enable = true;
    userName = "kite0208";
    userEmail = "kite0208@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  imports = [
    ./hyprland.nix
    ./theme.nix
  ];

  #  # Neovim
  #  programs.neovim = {
  #    enable = true;
  #    extraConfig = ''
  #      set number relativenumber
  #    '';
  #  };

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    fastfetch
    font-awesome
    alacritty
  ];

  # Alacritty config
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      ll = "ls -la";
      ai = "ollama run phi3";
    };
    bashrcExtra = ''
      set -o vi
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
