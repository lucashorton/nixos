{
  config,
  pkgs,
  lib,
  ...
}: {
  services.ssh-agent = {
    enable = true;
  };
}
