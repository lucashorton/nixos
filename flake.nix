{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      url = "github:Svenum/Solaar-Flake/main";
    };
  };

  outputs = inputs @ {
    nixpkgs,
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
            ];
          };
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}
