{
  config,
  pkgs,
  nix-colors,
  lib,
  ...
}: {
  imports = [
    ./kanshi.nix
    ./mako.nix
    ./mpdris2.nix
    ./ssh-agent.nix
    ./swayidle.nix
  ];
}