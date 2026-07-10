{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    defaultKeymap = "emacs";
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
    initContent = "autoload colors; colors\nNAME=$(figlet $HOST)\necho $fg[green]$NAME\necho ''\ninxi\necho ''";
  };
}
