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
		packages = with pkgs; [
			lato
			hack-font
			source-code-pro
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
		i3status-rust = {
			enable = true;
			bars = {
				bottom = {
					blocks = [
					  {
						alert = 10.0;
						alias = "/";
						block = "disk_space";
						info_type = "available";
						interval = 60;
						path = "/";
						unit = "GB";
						warning = 20.0;
					  }
					  {
						block = "memory";
						display_type = "memory";
						format_mem = "{mem_used_percents}";
						format_swap = "{swap_used_percents}";
					  }
					  {
						block = "cpu";
						interval = 1;
					  }
					  {
						block = "load";
						format = "{1m}";
						interval = 1;
					  }
					  {
						block = "sound";
					  }
					  {
						block = "time";
						format = "%a %d/%m %R";
						interval = 60;
					  }
					];
				};
			};
		};
	};

	# temp fix for manual-combined.xml error
	manual.manpages.enable = false;
}
