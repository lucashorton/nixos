{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    autotiling
    bitwarden
    bitwarden-desktop
    blender-hip
    chromium
    curl
    devbox
    ffmpeg
    figlet
    foliate
    gimp
    godot_4
    grim
    htop
    imv
    inkscape
    inxi
    kora-icon-theme
    krita
    mpc_cli
    mpv
    mpvpaper
    ncdu
    ncmpcpp
    nextcloud-client
    p7zip
    pavucontrol
    reaper
    remmina
    restic
    rsync
    slurp
    sway-audio-idle-inhibit
    unzip
    vscodium
    wf-recorder
    wget
    wl-clipboard
    xz
    zathura
    zip
  ];
}
