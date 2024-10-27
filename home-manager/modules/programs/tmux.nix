{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
  };
}
