{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "focused_window";
            format = " $title.str(max_w:56) |";
            theme_overrides = {
              idle_fg = "#${config.colorScheme.palette.base02}";
            };
          }
          {
            block = "music";
          }
          {
            block = "backlight";
            device = "intel_backlight";
            format = "  $brightness ";
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
        icons = "awesome6";
      };
    };
  };
}
