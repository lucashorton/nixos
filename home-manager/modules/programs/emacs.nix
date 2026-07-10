{ pkgs, ... }: 
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: [
      epkgs.add-node-modules-path
      epkgs.all-the-icons
      epkgs.apheleia
      epkgs.catppuccin-theme
      epkgs.cider
      epkgs.corfu
      epkgs.counsel
      epkgs.doom-modeline
      epkgs.eca
      epkgs.emms
      epkgs.lsp-mode
      epkgs.magit
      epkgs.marginalia
      epkgs.notmuch
      epkgs.dashboard
      epkgs.page-break-lines
      epkgs.paredit
      epkgs.projectile
      epkgs.transient
      epkgs.treesit-grammars.with-all-grammars
      epkgs.treesit-auto
      epkgs.vertico
      epkgs.vterm
    ];
  };
}
