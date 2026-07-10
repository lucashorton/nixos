{
  programs.firefox = {
    enable = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFormHistory = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      PasswordManagerEnabled = false;
      SearchBar = "unified"; # alternative: "separate"
    };
    profiles = {
      lucas = {
        extensions = {
	  force = true;
	};
        settings = {
          "extensions.autoDisableScopes" = 0;
          "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
          "dom.forms.autocomplete.formautofill" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
        };
        id = 0;
        isDefault = true;
        search = {
          default = "google";
          force = true;
        };
      };
    };
  };
}
