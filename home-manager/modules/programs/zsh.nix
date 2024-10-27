{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    defaultKeymap = "emacs";
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
    initExtra = "NAME=$(figlet $HOST)\necho $fg[green]$NAME\necho ''\ninxi\necho ''";
  };
}
