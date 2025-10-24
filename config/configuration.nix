{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/default.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}
