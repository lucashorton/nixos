{
  config,
  lib,
  pkgs,
  ...
}: {
  # Polkit
  security.polkit.enable = true;
}
