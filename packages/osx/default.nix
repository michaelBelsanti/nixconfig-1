{ nixpkgs, darwin, ... }:
let
	system = "x86_64-darwin";
	user = "tech4";
in
{
  	osx = darwin.lib.darwinSystem {
		inherit system;
		modules = [
			../cli
			../programming
		];
	};
}
