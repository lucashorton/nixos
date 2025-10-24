{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./modules
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  catppuccin = {
    enable = true;
    accent = "sky";
    flavor = "mocha";
  };
}
