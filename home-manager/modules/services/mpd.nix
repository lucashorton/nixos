{
  config,
  pkgs,
  lib,
  ...
}: {
  services.mpd = {
    enable = true;
    musicDirectory = "/home/lucas/Nextcloud/Music";
    # Optional:
    network.listenAddress = "any"; # if you want to allow non-localhost connections
    network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
    extraConfig = ''
      audio_output {
      type "pipewire"
      name "My PipeWire Output"
     }
    '';
};
}
