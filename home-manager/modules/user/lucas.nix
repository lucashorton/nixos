{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  xdg.userDirs.enable = true;
}
