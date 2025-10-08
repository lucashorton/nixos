{
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome_6
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
