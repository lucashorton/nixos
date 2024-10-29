{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/display-manager.nix
    ./modules/editor.nix
    ./modules/flatpak.nix
    ./modules/fonts.nix
    ./modules/gnome-keyring.nix
    ./modules/internationalization.nix
    ./modules/kanshi.nix
    ./modules/network.nix
    ./modules/opentabletdriver.nix
    ./modules/packages.nix
    ./modules/polkit.nix
    ./modules/printing.nix
    ./modules/sound.nix
    ./modules/sway.nix
    ./modules/timezone.nix
    ./modules/user.nix
    ./modules/zsh.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
