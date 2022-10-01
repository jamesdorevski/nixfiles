{ config, pkgs, ... }:

{
	home = {
		stateVersion = "22.05";
		username = "james";
		homeDirectory = "/home/james";
		file = {
			".config/alacritty/alacritty.yml".source = ./alacritty.yml;
			".config/nvim/init.vim".source = ./init.vim;
		};
	};

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
			'';
			shellAliases = {
				vi = "nvim";
			};
		};
	};
}
