{
  config,
  pkgs,
  lib,
  ...
}: {
  services.mpdris2 = {
    enable = true;
    notifications = true;
  };
}
