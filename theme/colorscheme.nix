{
  config,
  pkgs,
  nixvim,
  nix-colors,
  lib,
  ...
}: {
  colorScheme = {
    slug = "tokyo-night";
    name = "Tokyo Night";
    author = "Lucas Horton (https://github.com/lucashorton)";
    palette = {
      base00 = "24283b";
      base01 = "f28779";
      base02 = "d5ff80";
      base03 = "ffd173";
      base04 = "73d0ff";
      base05 = "dfbfff";
      base06 = "5ccfe6";
      base07 = "c0caf5";
      base08 = "fcfcfc";
      base09 = "f07171";
      base0A = "86b300";
      base0B = "f2ae49";
      base0C = "399ee6";
      base0D = "a37acc";
      base0E = "55b4d4";
      base0F = "5c6166";
    };
  };
}
