{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./modules
  ];

  home.stateVersion = "25.05";
  home.sessionPath = [ "$HOME/.config/emacs/bin" ];
  programs.home-manager.enable = true;
}
