{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  imports = [
    nixvim.homeManagerModules.nixvim
    nix-colors.homeManagerModules.default
    ./modules/theme/default.nix
    ./modules/programs/default.nix
    ./modules/services/default.nix
    ./modules/user/lucas.nix
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
