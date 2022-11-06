{
	description = "Cullvox's Nix Config";

	# Describe the inputs of the flake
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

	# Describe the outputs of this flake
  	outputs = inputs @ { self, nixpkgs, home-manager, darwin, ... }:
  	let
    		user = "cullvox";
  	in
  	{
		darwinConfigurations = (
			import ./packages/osx {
				inherit (nixpkgs)lib;
				inherit nixpkgs darwin;
			}
		);
	};
}

