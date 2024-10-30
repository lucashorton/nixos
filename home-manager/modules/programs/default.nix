{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  imports = [
    ./direnv.nix
    ./firefox.nix
    ./floorp.nix
    ./foot.nix
    ./fuzzel.nix
    ./fzf.nix
    ./git.nix
    ./i3status-rust.nix
    ./nixvim.nix
    ./packages.nix
    ./ssh.nix
    ./starship.nix
    ./sway.nix
    ./swaylock.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
