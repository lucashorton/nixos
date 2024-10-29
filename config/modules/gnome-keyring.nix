{
  config,
  lib,
  pkgs,
  ...
}: {
  # Gnome Keyring
  services.gnome.gnome-keyring.enable = true;
}
