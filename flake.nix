{
  description = "zasdaym";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      nix-darwin,
      home-manager,
    }:
    let
      darwin = import ./darwin.nix;
    in
    {
      darwinConfigurations.MAC-QY2G1C3604 = nix-darwin.lib.darwinSystem {
        modules = [
          darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              pkgs-unstable = nixpkgs-unstable.legacyPackages.aarch64-darwin;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zasda = ./home.nix;
            nixpkgs.config.allowUnfree = true;
          }
        ];
      };
    };
}
