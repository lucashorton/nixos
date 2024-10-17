{
  config,
  pkgs,
  nix-colors,
  ...
}: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.tokyo-night-dark;

  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  xdg.userDirs.enable = true;

  home.packages = with pkgs; [
    # WM
    i3status-rust

    # Archives
    zip
    xz
    unzip
    p7zip

    #Utils
    rsync
    wget
    curl
    restic
    inxi
    figlet
    ncdu
    grim
    slurp
    wf-recorder
    ncmpcpp

    #Graphics
    gimp
    inkscape
    imv
    zathura
    blender

    #Network
    brave
    nextcloud-client
    remmina

    #Nix
    alejandra
  ];

  programs.git = {
    enable = true;
    userName = "Lucas Horton";
    userEmail = "lucas@lucashorton.com";
  };

  programs.starship = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
    initExtra = "NAME=$(figlet $HOST)\necho $fg[green]$NAME\necho ''\ninxi\necho ''";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "MonoLisaVariable:size=8";
        pad = "10x10";
        bold-text-in-bright = false;
        dpi-aware = "yes";
      };
      cursor = {
        color = "ffcc66 665a44";
      };
      colors = {
        foreground = "c0caf5";
        background = "24283b";
        regular0 = "#${config.colorScheme.palette.base00}";
        regular1 = "#${config.colorScheme.palette.base01}";
        regular2 = "#${config.colorScheme.palette.base02}";
        regular3 = "#${config.colorScheme.palette.base03}";
        regular4 = "#${config.colorScheme.palette.base04}";
        regular5 = "#${config.colorScheme.palette.base05}";
        regular6 = "#${config.colorScheme.palette.base06}";
        regular7 = "#${config.colorScheme.palette.base07}";
        bright0 = "#${config.colorScheme.palette.base08}";
        bright1 = "#${config.colorScheme.palette.base09}";
        bright2 = "#${config.colorScheme.palette.base0A}";
        bright3 = "#${config.colorScheme.palette.base0B}";
        bright4 = "#${config.colorScheme.palette.base0C}";
        bright5 = "#${config.colorScheme.palette.base0D}";
        bright6 = "#${config.colorScheme.palette.base0E}";
        bright7 = "#${config.colorScheme.palette.base0F}";
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "MonoLisa Variable:size=10";
        dpi-aware = "auto";
        icon-theme = "Kora";
        icons-enabled = "Yes";
        match-mode = "fuzzy";
        show-actions = "no";
        terminal = "foot";
        lines = 10;
        width = 40;
        tabs = 8;
        horizontal-pad = 20;
        vertical-pad = 10;
        inner-pad = 20;
        line-height = 24;
        layer = "overlay";
      };
      colors = {
        background = "24283bff";
        text = "737aa2ff";
        prompt = "c0caf5ff";
        input = "c0caf5ff";
        placeholder = "c0caf5ff";
        match = "ff007cff";
        selection = "1f2335ff";
        selection-text = "c0caf5ff";
        border = "1f2335ff";
      };
      border = {
        width = 8;
        radius = 15;
      };
    };
  };

  programs.swaylock = {
    enable = true;
  };

  services.mpd = {
    enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
