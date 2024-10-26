{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };
}
