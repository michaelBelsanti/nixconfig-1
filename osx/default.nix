{ lib, inputs, nixpkgs, home-manager, darwin, user, ... }:
let
	system = "x86_64-darwin";
	user = "tech4";
in
{
	osx = darwin.lib.darwinSystem {
		inherit system;
		specialArgs = { inherit inputs user; } 
		modules = [
			../packages/programming
			../packages/cli
		]
	}
}
