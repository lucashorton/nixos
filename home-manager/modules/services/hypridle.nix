{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
	before_sleep_cmd = "hyprlock"; # Lock before suspending
        after_sleep_cmd = "hyprctl dispatch dpms on"; # Turn display on after suspend
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
	{
          timeout = 1800; # 30 minutes
          on-timeout = "systemctl suspend";
        }
      ];

    };
  };
}
