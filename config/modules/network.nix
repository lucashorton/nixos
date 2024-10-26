{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "tangaroa";
  networking.networkmanager.enable = true;
}
