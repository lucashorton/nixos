{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
}
