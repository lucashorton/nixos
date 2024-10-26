{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
            position = "4267,0";
          }
          {
            criteria = "DP-5";
            scale = 1.5;
            position = "1707,0";
          }
          {
            criteria = "HDMI-A-1";
            scale = 1.5;
            position = "0,0";
          }
        ];
        profile.exec = [
          "swaymsg workspace 1, move workspace to eDP-1"
          "swaymsg workspace 2, move workspace to DP-5"
          "swaymsg workspace 3, move workspace to HDMI-A-1"
        ];
      }
    ];
  };
}
