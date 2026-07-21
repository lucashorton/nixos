{ config, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs simple-scan yelp];
  environment.systemPackages = with pkgs; [
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.appindicator
  ];
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true; # prevents overriding
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "teal";
        };
        "org/gnome/desktop/input-sources" = {
          xkb-options = [ "ctrl:nocaps" ];
        };
      };
    }
  ];
  # Apply user monitor settings to login screen
  # by copying the user's monitors.xml to GDM's config directory
  systemd.services.applyUserMonitorSettings = let
    username = "lucas";
    gdmConfigDir = "/var/lib/gdm/seat0/config";
  in {
    description = "Apply user monitor settings to GDM login screen";
    after = [ "network.target" "systemd-user-sessions.service" "display-manager.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo \"Applying user monitor settings to GDM login screen\" && mkdir -p ${gdmConfigDir} && echo \"Created ${gdmConfigDir} directory\" && [ \"/home/${username}/.config/monitors.xml\" -ef \"${gdmConfigDir}/monitors.xml\" ] || cp /home/${username}/.config/monitors.xml ${gdmConfigDir}/monitors.xml && echo \"Copied monitors.xml to ${gdmConfigDir}/monitors.xml\" && chown gdm:gdm ${gdmConfigDir}/monitors.xml && echo \"Changed ownership of monitors.xml to gdm\"'";
    };
  };
}
