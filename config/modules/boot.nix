{
  config,
  lib,
  pkgs,
  ...
}: {
  # Use the systemd-boot EFI boot loader.
  boot = {
    plymouth = {
      enable = true;
    };

    consoleLogLevel = 0;
    initrd = {
      enable = true;
      supportedFilesystems = [ "btrfs" ];
      verbose = false;
      systemd.enable = true;
    };

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
