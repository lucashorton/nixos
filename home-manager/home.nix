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
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 28;
  };
  home.file.".zprofile".text = ''
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
    if uwsm check may-start; then
      exec uwsm start hyprland.desktop
    fi
  '';
}
