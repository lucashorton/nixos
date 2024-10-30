{
  config,
  pkgs,
  nix-colors,
  lib,
  ...
}: {
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
        background = "${config.colorScheme.palette.base00}ff";
        text = "${config.colorScheme.palette.base07}ff";
        input = "${config.colorScheme.palette.base07}ff";
        placeholder = "${config.colorScheme.palette.base07}ff";
        match = "${config.colorScheme.palette.base01}ff";
        selection = "${config.colorScheme.palette.base06}ff";
        selection-text = "${config.colorScheme.palette.base00}ff";
        border = "${config.colorScheme.palette.base00}ff";
      };
      border = {
        width = 8;
        radius = 15;
      };
    };
  };
}
