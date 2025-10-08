{
  pkgs,
  ...
}: {
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    neovim
    gnome-browser-connector
  ];
}
