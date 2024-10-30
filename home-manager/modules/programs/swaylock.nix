{
  config,
  pkgs,
  nix-colors,
  lib,
  ...
}: {
  programs.swaylock = {
    enable = true;
    settings = {
      color = "${config.colorScheme.palette.base00}";
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "ffffff";
      show-failed-attempts = true;
    };
  };
}
