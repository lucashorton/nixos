{
  config,
  pkgs,
  nixvim,
  lib,
  ...
}: {
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
    plugins = {
      bufferline.enable = true;
      cmp.enable = true;
      direnv.enable = true;
      fzf-lua.enable = true;
      fugitive.enable = true;
      gitgutter.enable = true;
      godot.enable = true;
      illuminate.enable = true;
      lsp.enable = true;
      lualine.enable = true;
      neo-tree.enable = true;
      nix.enable = true;
      oil.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      vim-css-color.enable = true;
      vim-surround.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
  };
}
