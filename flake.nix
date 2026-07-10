{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix/release-26.05";
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
  };
    emacs-overlay={
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs"; # Pin nixpkgs to prevent duplicate downloads
    };
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz"; # For latest stable version
    };
  };

  outputs = inputs @ {
    nixpkgs,
    catppuccin,
    zen-browser,
    emacs-overlay,
    solaar,
    home-manager,
    ...
  } : {
    nixosConfigurations.tangaroa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        catppuccin.nixosModules.catppuccin
	solaar.nixosModules.default
        home-manager.nixosModules.home-manager
        ./config/configuration.nix
        {
	  nixpkgs.overlays = [ emacs-overlay.overlays.default ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.extraSpecialArgs = { inherit inputs; }; 
          home-manager.users.lucas = {
            imports = [
              ./home-manager/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}
