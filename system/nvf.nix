{
  config,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
        };
      };
    };
  };
}
