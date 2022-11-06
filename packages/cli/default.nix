# Contains the packages used in my common CLI environment

{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# Information Gathering
		nitch
		
		# Text Editors
		helix
		nano

		# Source Controle 
		git
	]
}
