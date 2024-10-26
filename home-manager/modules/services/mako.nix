{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  services.mako = {
    enable = true;
    backgroundColor = "#${config.colorScheme.palette.base00}";
    borderRadius = 15;
    borderSize = 0;
    defaultTimeout = 5000;
    font = "MonoLisa Variable 12";
    height = 125;
    padding = "12";
    textColor = "#${config.colorScheme.palette.base07}";
    width = 500;
  };

  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
