{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  } : {
    nixosConfigurations.tangaroa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./config/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.lucas = import ./home-manager/home.nix;
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}
