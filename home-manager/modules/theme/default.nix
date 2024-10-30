{
  config,
  pkgs,
  nix-colors,
  lib,
  ...
}: {
  imports = [
    ./colorscheme.nix
    ./cursor.nix
    ./gtk.nix
  ];
}
