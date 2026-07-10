{ pkgs, inputs, ... }: {
  
  imports = [
    # Choose between: .default, .beta, .twilight, or .twilight-official
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    # Set as your default browser across the desktop environment
    setAsDefaultBrowser = true; 
    
    # Optional: Set global browser policies
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      OfferToSaveLogins = false;
    };
  };

}

