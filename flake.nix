{
  description = "Cullvox's Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = inputs @ { self, nixpkgs, home-manager, darwin, ... }:
  let
    user = "cullvox";
  in
  {
    darwinConfigurations = {
      osx = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
