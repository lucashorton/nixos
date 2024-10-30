{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
  };
}
