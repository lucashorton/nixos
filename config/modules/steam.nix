{
  programs.gamescope = {
    enable = true;
    capSysNice = true; # Required for proper real-time thread scheduling
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # Adds a Gamescope session to your display manager
  };

  programs.gamemode.enable = true; # Optional but recommended for better gaming performance
}
