{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./boot.nix
    ./display-manager.nix
    ./editor.nix
    ./fonts.nix
    ./gnome-keyring.nix
    ./internationalization.nix
    ./kanshi.nix
    ./network.nix
    ./opentabletdriver.nix
    ./packages.nix
    ./polkit.nix
    ./printing.nix
    ./sound.nix
    ./steam.nix
    ./sway.nix
    ./timezone.nix
    ./user.nix
    ./zsh.nix
  ];
}
