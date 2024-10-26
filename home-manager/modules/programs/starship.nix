{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
  };
}
