{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/default.nix
  ];

  # Enable flakes
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    # Required so non-root users are allowed to use the above substituter/keys.
    # Use @wheel for all sudo users, or list your username explicitly.
    trusted-users = ["root" "@wheel"];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  services.logind.settings.Login.HandleLidSwitch= "ignore";
  services.logind.settings.Login.HandleLidSwitchDocked = "ignore";
  
  services.udev.extraRules = ''
    # 8BitDo Ultimate 2 - 2.4GHz Dongle / Wired
    KERNEL=="hidraw*", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="6012", MODE="0660", GROUP="input", TAG+="uaccess"

    # 8BitDo Ultimate 2 - Bluetooth
    KERNEL=="hidraw*", KERNELS=="*2DC8:6012*", MODE="0660", GROUP="input", TAG+="uaccess"

    # Nuphy Air65 V3
    KERNEL=="hidraw*", ATTRS{idVendor}=="19f5", MODE="0666"
  '';

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.steam-hardware.enable = true;

# Enable appimages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

# Enable unfree packages
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}
