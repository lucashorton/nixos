{ pkgs, ... }: {
  imports = [
    ./modules
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
  catppuccin = {
    enable = true;
    accent = "sky";
    flavor = "mocha";
  };
}
