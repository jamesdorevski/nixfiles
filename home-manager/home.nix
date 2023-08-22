{ config, pkgs, ... }:
{
	imports = [
		./git/git.nix
		./vscode/vscode.nix
	];

	home = {
		stateVersion = "22.05";
		username = "james";
		homeDirectory = "/home/james";
		file = {
			".config/nvim".source = ./nvim;
		};
		packages = with pkgs; [
			lato
			inconsolata
			liberation_ttf
			noto-fonts
		];
	};

	fonts.fontconfig.enable = true;

	nixpkgs.config.allowUnfree = true;

	programs = {
		home-manager = {
			enable = true;
		};
	};

	# temp fix for manual-combined.xml error
	manual.manpages.enable = false;
}
