{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  services.ssh-agent = {
    enable = true;
  };
}
