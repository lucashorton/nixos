{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Lucas Horton";
    userEmail = "lucas@lucashorton.com";
  };
}
