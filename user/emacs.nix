{
  config,
  pkgs,
  ...
}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = ''
      (tool-bar-mode -1)
      (tooltip-mode -1)
      (ste-fringe-mode 10)
      (setq standard-indent 2)
      (stq visible-bell t)
      (load-theme "gruvbox-dark")
    '';
  };
}
