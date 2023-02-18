{ config, pkgs, ... }:
{
	imports = [
		./git/git.nix
		./fish/fish.nix
		./vscode/vscode.nix
		./i3status-rust/i3status-rust.nix
	];

	home = {
		stateVersion = "22.05";
		username = "james";
		homeDirectory = "/home/james";
		file = {
			".config/alacritty/alacritty.yml".source = ./alacritty/alacritty.yml;
			".config/nvim/init.vim".source = ./nvim/init.vim;
			".config/i3/config".source = ./i3/config;
		};
		packages = with pkgs; [
			lato
			hack-font
			source-code-pro
			inconsolata
		];
	};

	fonts.fontconfig.enable = true;

	gtk = {
		enable = true;
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome.gnome-themes-extra;
		};
	};
	
	nixpkgs.config.allowUnfree = true;

	programs = {
		home-manager = {
			enable = true;
		};
	};

	# temp fix for manual-combined.xml error
	manual.manpages.enable = false;
}
