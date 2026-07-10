{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
      };
      listener = [
        {
          on-timeout = "loginctl lock-session";
          timeout = 300;
        }
        {
	  on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'";
	  on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
          timeout = 330;
        }
      ];

    };
  };
}
