{
  config,
  lib,
  pkgs,
  ...
}: {
  # Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
