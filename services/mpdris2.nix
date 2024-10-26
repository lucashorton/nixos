{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  services.mpdris2 = {
    enable = true;
    notifications = true;
  };
}
