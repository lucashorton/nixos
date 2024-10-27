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
    ./modules/theme/colorscheme.nix
    ./modules/theme/cursor.nix
    ./modules/theme/gtk.nix
    ./modules/programs/firefox.nix
    ./modules/programs/foot.nix
    ./modules/programs/fuzzel.nix
    ./modules/programs/fzf.nix
    ./modules/programs/git.nix
    ./modules/programs/i3status-rust.nix
    ./modules/programs/nixvim.nix
    ./modules/programs/packages.nix
    ./modules/programs/starship.nix
    ./modules/programs/sway.nix
    ./modules/programs/swaylock.nix
    ./modules/programs/tmux.nix
    ./modules/programs/zsh.nix
    ./modules/services/kanshi.nix
    ./modules/services/mako.nix
    ./modules/services/mpdris2.nix
    ./modules/services/swayidle.nix
    ./modules/user/lucas.nix
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
