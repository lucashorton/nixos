{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  xdg.userDirs.enable = true;
}
