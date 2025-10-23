{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix/release-25.05";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    catppuccin,
    home-manager,
    ...
  } : {
    nixosConfigurations.tangaroa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./config/configuration.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
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
