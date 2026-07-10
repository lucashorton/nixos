{ config, pkgs, ... }:
{
  services.tlp.enable = false;
  services.tuned={
    enable = true;
    ppdSupport = true;
  };
}
