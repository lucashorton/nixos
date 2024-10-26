{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
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
            names = ["MonoLisa Variable" "Font Awesome 6 Free"];
            style = "Medium";
            size = 10.0;
          };
        }
      ];
      modifier = "Mod4";
      startup = [
        {command = "sway-audio-idle-inhibit";}
        {command = "sleep 5; systemctl --user start kanshi.service";}
        #{command = "mpvpaper -p -o '--loop panscan=1.0' '*' ${config.home.homeDirectory}/Video/Backgrounds/CozyBalconyOasis_4K_cc2023.mp4";}
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
      input = {
        "2362:628:PIXA3854:00_093A:0274_Touchpad" = {
          tap = "enabled";
          drag = "enabled";
        };
      };
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        lib.mkOptionDefault
        {
          "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'";
          "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'";
          "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
        };

      left = "h";
      menu = "fuzzel";
      output = {
        eDP-1 = {
          bg = "${config.home.homeDirectory}/Pictures/CozyBalconyOasis.png fill";
        };
        DP-5 = {
          bg = "${config.home.homeDirectory}/Pictures/CozyBalconyOasis.png fill";
        };
        HDMI-A-1 = {
          bg = "${config.home.homeDirectory}/Pictures/CozyBalconyOasis.png fill";
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
}
