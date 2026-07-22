  # FIXME: https://github.com/NixOS/nixpkgs/issues/484328
  services.displayManager.defaultSession = "hyprland-uwsm";

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/start-hyprland";
      };
    };
  };
