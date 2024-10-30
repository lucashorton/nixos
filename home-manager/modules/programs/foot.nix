{
  config,
  pkgs,
  nix-colors,
  lib,
  ...
}: {
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
        foreground = "${config.colorScheme.palette.base07}";
        background = "${config.colorScheme.palette.base00}";
        regular0 = "${config.colorScheme.palette.base00}";
        regular1 = "${config.colorScheme.palette.base01}";
        regular2 = "${config.colorScheme.palette.base02}";
        regular3 = "${config.colorScheme.palette.base03}";
        regular4 = "${config.colorScheme.palette.base04}";
        regular5 = "${config.colorScheme.palette.base05}";
        regular6 = "${config.colorScheme.palette.base06}";
        regular7 = "${config.colorScheme.palette.base07}";
        bright0 = "${config.colorScheme.palette.base08}";
        bright1 = "${config.colorScheme.palette.base09}";
        bright2 = "${config.colorScheme.palette.base0A}";
        bright3 = "${config.colorScheme.palette.base0B}";
        bright4 = "${config.colorScheme.palette.base0C}";
        bright5 = "${config.colorScheme.palette.base0D}";
        bright6 = "${config.colorScheme.palette.base0E}";
        bright7 = "${config.colorScheme.palette.base0F}";
      };
    };
  };
}
