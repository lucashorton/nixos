{
  pkgs,
  ...
}: {
  users.users.lucas = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };
}
