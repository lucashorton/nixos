{
  config,
  lib,
  pkgs,
  ...
}: {
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    alejandra
    curl
    ffmpeg
    foot
    fuzzel
    git
    grim
    htop
    i3status-rust
    imv
    kanshi
    mako
    mpv
    ncdu
    p7zip
    pavucontrol
    restic
    rsync
    slurp
    sway-audio-idle-inhibit
    unzip
    wf-recorder
    wget
    wl-clipboard
    xz
    zathura
    zip
  ];
}
