{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  imports = [
    nixvim.homeManagerModules.nixvim
    nix-colors.homeManagerModules.default
    ./theme/colorscheme.nix
    ./theme/cursor.nix
    ./theme/gtk.nix
    ./programs/foot.nix
    ./programs/fuzzel.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/i3status-rust.nix
    ./programs/nixvim.nix
    ./programs/starship.nix
    ./programs/sway.nix
    ./programs/swaylock.nix
    ./programs/zsh.nix
    ./services/kanshi.nix
    ./services/mako.nix
    ./services/mpdris2.nix
    ./services/swayidle.nix
  ];

  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  xdg.userDirs.enable = true;

  home.packages = with pkgs; [
    bitwarden
    bitwarden-desktop
    blender
    chromium
    figlet
    firefox
    foliate
    gimp
    godot_4
    inkscape
    inxi
    kora-icon-theme
    krita
    mpc_cli
    mpvpaper
    ncmpcpp
    nextcloud-client
    reaper
    remmina
    vscodium
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
