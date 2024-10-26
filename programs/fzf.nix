{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
