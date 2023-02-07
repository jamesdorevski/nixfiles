{ config, pkgs, ... }:

{
	home = {
		stateVersion = "22.05";
		username = "james";
		homeDirectory = "/home/james";
		file = {
			".config/alacritty/alacritty.yml".source = ./alacritty/alacritty.yml;
			".config/nvim/init.vim".source = ./nvim/init.vim;
			".config/i3/config".source = ./i3/config;
		};
	};

	fonts.fontconfig.enable = true;
	home.packages = with pkgs; [
		lato
		hack-font
		source-code-pro
	];
	
	nixpkgs.config.allowUnfree = true;

	programs = {
		home-manager = {
			enable = true;
		};
		git = {
			enable = true;
   			userName = "jamesdorevski";
    			userEmail = "james@jamesdorevski.com";
    			aliases = {
			      st = "status";
			      cm = "commit";
			      pu = "push";
			      pl = "pull";
			      aa = "add .";
    			};
		};
		fish = {
			enable = true;
			shellInit = ''
				direnv hook fish | source		
				jump shell fish | source
				fish_vi_key_bindings
			'';
			shellAliases = {
				vi = "nvim";
			};
		};
		vscode = {
			enable = true;
			extensions = with pkgs.vscode-extensions; [
				vscodevim.vim
				ms-dotnettools.csharp
				bbenoist.nix
			];
			userSettings = {
				"editor.fontFamily" = "'Fira Code'";			
			};
		};
	};

	# temp fix for manual-combined.xml error
	manual.manpages.enable = false;
}
