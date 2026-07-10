{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true; # Automatically starts and links Waybar with your graphical session

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
          "hyprland/submap"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "mpd"
          "pulseaudio"
          "cpu"
          "memory"
          "network"
	  "battery"
          "tray"
        ];

        # --- Module Configurations ---

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        clock = {
	  format = "{:%I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%m-%d-%Y}";
        };

        mpd = {
          format = "{stateIcon} {artist} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 2;
          state-icons = {
            paused = "⏸";
            playing = "▶";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{}% ";
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} 🖧";
          format-disconnected = "Disconnected ⚠";
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
	
	battery = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-icons = ["" "" "" "" ""];
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
      };

        tray = {
          spacing = 10;
        };
      };
    };

    # Custom styling using CSS directly inside Nix
    style = ''
      * {
        font-family: "Operator Mono SSm", Roboto, Helvetica, Arial, sans-serif;
        font-size: 13px;
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background: none;
        color: #e0def4;
      }

      .modules-left {
        margin-top:5px;
        margin-left:10px;
        color: #e0def4;
        background-color: #191724;
        border-radius: 4px;
	padding: 0 10px 0 5px;
      }
      
      .modules-center {
        margin-top:5px;
      }

      .modules-right{
        margin-top:5px;
        margin-right:10px;
      }

      #workspaces button {
        padding: 0;
        background-color: transparent;
        color: #e0def4;
      }

      #workspaces button.focused,
      #workspaces button.active {
        color: #9ccfd8;
	background-color: #191724;
      }

      #clock,
      #mpd,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #battery,
      #tray
      {
        padding: 0 10px;
        margin: 0 2px;
        color: #e0def4;
        background-color: #191724;
        border-radius: 4px;
      }

      #mpd {
        background-color: #31748f;
        color: #e0def4;
      }

      #mpd.disconnected {
        background-color: #eb6f92;
      }

      #mpd.stopped {
        background-color: #191724;
      }
    '';
  };
}
