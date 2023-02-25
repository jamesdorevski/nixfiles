{ config, pkgs, ... }:
{
	imports = [
		./git/git.nix
		./fish/fish.nix
		./vscode/vscode.nix
	];

	home = {
		stateVersion = "22.05";
		username = "james";
		homeDirectory = "/home/james";
		file = {
			".config/nvim/init.vim".source = ./nvim/init.vim;
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
