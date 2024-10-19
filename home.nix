{
  config,
  pkgs,
  nix-colors,
  ...
}: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = {
    slug = "tokyo-night";
    name = "Tokyo Night";
    author = "Lucas Horton (https://github.com/lucashorton)";
    palette = {
      base00 = "#24283b";
      base01 = "#f28779";
      base02 = "#d5ff80";
      base03 = "#ffd173";
      base04 = "#73d0ff";
      base05 = "#dfbfff";
      base06 = "#5ccfe6";
      base07 = "#c0caf5";
      base08 = "#fcfcfc";
      base09 = "#f07171";
      base0A = "#86b300";
      base0B = "#f2ae49";
      base0C = "#399ee6";
      base0D = "#a37acc";
      base0E = "#55b4d4";
      base0F = "#5c6166";
    };
  };

  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  xdg.userDirs.enable = true;

  home.packages = with pkgs; [
    ncmpcpp
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
      colors = {
        foreground = "#${config.colorScheme.palette.base07}";
        background = "#${config.colorScheme.palette.base00}";
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
        background = "#${config.colorScheme.palette.base00}";
        text = "#${config.colorScheme.palette.base07}";
        input = "#${config.colorScheme.palette.base07}";
        placeholder = "#${config.colorScheme.palette.base07}";
        match = "#${config.colorScheme.palette.base01}";
        selection = "#${config.colorScheme.palette.base01}";
        selection-text = "#${config.colorScheme.palette.base07}";
        border = "#${config.colorScheme.palette.base00}";
      };
      border = {
        width = 8;
        radius = 15;
      };
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "focused_window";
            format = " $title.str(max_w:56) |";
          }
          {
            block = "music";
          }
          {
            block = "backlight";
            device = "intel_backlight";
          }
          {
            block = "battery";
            format = " $icon $percentage ";
          }
          {
            block = "sound";
            step_width = 5;
          }
          {
            block = "net";
            format = " $icon {$signal_strength|Wired} ";
            format_alt = " $icon {$signal_strength $ssid $frequency|Wired connection} via $device ";
          }
          {
            block = "time";
            interval = 5;
            format = " $timestamp.datetime(f:'%a %m/%d %I:%M %p') ";
          }
        ];
        settings = {
          theme = {
            theme = "plain";
            overrides = {
              idle_fg = "#${config.colorScheme.palette.base07}";
              info_fg = "#${config.colorScheme.palette.base07}";
              idle_bg = "#${config.colorScheme.palette.base00}";
              good_bg = "#${config.colorScheme.palette.base00}";
              info_bg = "#${config.colorScheme.palette.base00}";
              separator_bg = "#${config.colorScheme.palette.base00}";
            };
          };
        };
        icons = "awesome5";
      };
    };
  };

  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
            position = "4267,0";
          }
          {
            criteria = "DP-5";
            scale = 1.5;
            position = "1707,0";
          }
          {
            criteria = "HDMI-A-1";
            scale = 1.5;
            position = "0,0";
          }
        ];
        profile.exec = [
          "\${pkg.sway}/bin/swaymsg workspace 1, move workspace to eDP-1"
          "\${pkg.sway}/bin/swaymsg workspace 2, move workspace to DP-5"
          "\${pkg.sway}/bin/swaymsg workspace 3, move workspace to HDMI-A-1"
        ];
      }
    ];
  };

  services.mako = {
    enable = true;
    backgroundColor = "#${config.colorScheme.palette.base00}";
    borderRadius = 15;
    borderSize = 0;
    defaultTimeout = 5000;
    font = "MonoLisa Variable 8";
    height = 125;
    padding = "12";
    textColor = "#${config.colorScheme.palette.base07}";
    width = 500;
  };

  services.mpd = {
    enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      bars = [
        {
          mode = "dock";
          position = "top";
          statusCommand = "i3status-rs --never-pause config-default.toml";
          trayOutput = "*";
          workspaceButtons = true;
          colors = {
            activeWorkspace = {
              background = "#${config.colorScheme.palette.base00}";
              border = "#${config.colorScheme.palette.base00}";
              text = "#${config.colorScheme.palette.base07}";
            };
            background = "#${config.colorScheme.palette.base00}";
            bindingMode = {
              background = "#${config.colorScheme.palette.base00}";
              border = "#${config.colorScheme.palette.base00}";
              text = "#${config.colorScheme.palette.base09}";
            };
            focusedWorkspace = {
              background = "#${config.colorScheme.palette.base00}";
              border = "#${config.colorScheme.palette.base00}";
              text = "#${config.colorScheme.palette.base0B}";
            };
            inactiveWorkspace = {
              background = "#${config.colorScheme.palette.base00}";
              border = "#${config.colorScheme.palette.base00}";
              text = "#${config.colorScheme.palette.base07}";
            };
            statusline = "#${config.colorScheme.palette.base07}";
          };
          fonts = {
            names = ["MonoLisa Variable"];
            style = "Medium";
            size = 10.0;
          };
        }
      ];
      modifier = "Mod4";
      startup = [
        {command = "mako";}
        {command = "sleep 5; systemctl --user start kanshi.service";}
      ];
      colors = {
        background = "#${config.colorScheme.palette.base00}";
        focused = {
          background = "#${config.colorScheme.palette.base00}";
          border = "#${config.colorScheme.palette.base06}";
          childBorder = "#${config.colorScheme.palette.base06}";
          indicator = "#${config.colorScheme.palette.base06}";
          text = "#${config.colorScheme.palette.base07}";
        };
        focusedInactive = {
          background = "#${config.colorScheme.palette.base00}";
          border = "#${config.colorScheme.palette.base00}";
          childBorder = "#${config.colorScheme.palette.base00}";
          indicator = "#${config.colorScheme.palette.base06}";
          text = "#${config.colorScheme.palette.base07}";
        };
        placeholder = {
          background = "#${config.colorScheme.palette.base06}";
          border = "#${config.colorScheme.palette.base00}";
          childBorder = "#${config.colorScheme.palette.base06}";
          indicator = "#${config.colorScheme.palette.base06}";
          text = "#${config.colorScheme.palette.base08}";
        };
        unfocused = {
          background = "#${config.colorScheme.palette.base0F}";
          border = "#${config.colorScheme.palette.base00}";
          childBorder = "#${config.colorScheme.palette.base00}";
          indicator = "#${config.colorScheme.palette.base06}";
          text = "#${config.colorScheme.palette.base08}";
        };
        urgent = {
          background = "#${config.colorScheme.palette.base01}";
          border = "#${config.colorScheme.palette.base01}";
          childBorder = "#${config.colorScheme.palette.base01}";
          indicator = "#${config.colorScheme.palette.base09}";
          text = "#${config.colorScheme.palette.base08}";
        };
      };
      down = "j";
      floating = {
        border = 0;
        criteria = [
          {
            title = "Steam - News";
          }
        ];
        titlebar = false;
      };
      focus = {
        followMouse = true;
        mouseWarping = true;
        newWindow = "focus";
      };
      fonts = {
        names = ["MonoLisa Variable"];
        style = "Medium";
        size = 10.0;
      };
      gaps = {
        inner = 10;
        smartBorders = "on";
        smartGaps = false;
      };
      left = "h";
      menu = "fuzzel";
      output = {
        eDP-1 = {
          bg = "/home/lucas/Pictures/cyberpunk.png fill";
        };
        DP-5 = {
          bg = "/home/lucas/Pictures/cyberpunk.png fill";
        };
        HDMI-A-1 = {
          bg = "/home/lucas/Pictures/cyberpunk.png fill";
        };
      };
      right = "l";
      up = "k";
      window = {
        titlebar = false;
      };
    };
    swaynag = {
      enable = true;
    };
    systemd = {
      xdgAutostart = true;
    };
  };

  programs.swaylock = {
    enable = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
