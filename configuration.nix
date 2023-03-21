{ config, pkgs, ... }:
{
  	imports = [  
		./hardware-configuration.nix	 
		<home-manager/nixos>
		<nixos-hardware/lenovo/thinkpad/t14/amd/gen2>
 	];

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot/efi";
			};
		};
	};

	networking = {
		hostName = "nixos";
		networkmanager.enable = true;
	};

  	time.timeZone = "Australia/Sydney";
  	i18n.defaultLocale = "en_AU.utf8";
		
	services = {
		xserver = {
			enable = true;
			layout = "au";
			desktopManager = {
				xterm.enable = false;
			};
			displayManager = {
				defaultSession = "none+i3";
			};
			windowManager.i3 = {
				enable = true;
				extraPackages = with pkgs; [
					i3lock
					rofi
					maim
					xclip
				];
			};
			libinput = {
				touchpad = {
					tapping = false;
					naturalScrolling = true;
				};
			};
		};
		printing = {
			enable = true;
		};
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};
	};

	sound.enable = true;
	hardware = {
		pulseaudio = {
			enable = false;
		};
	};
	security.rtkit.enable = true;
  	
	users.users.james = {
   		isNormalUser = true;
    		description = "James Dorevski";
		shell = pkgs.fish;
 	   	extraGroups = [ 
			"networkmanager" 
			"wheel" 
			"docker"
		];
  	};

	nixpkgs.config.allowUnfree = true;
	environment = {
		pathsToLink = [ "/libexec" ];
		systemPackages = with pkgs; [
			# dev
			mitscheme
			dotnet-sdk
			go
			jdk

			# cli
			neovim
			tmux
			direnv
			htop
			fzf
			srandrd
			tldr
			thefuck
			ranger
			tree
			jump
			dive
			sox
			zip 
			unzip
			
			# gui
			spotify
			transmission-gtk
			vlc
			slack
			obsidian
			libreoffice
			gimp
			prismlauncher
			zoom-us
			discord
			google-chrome
			gnome.gnome-tweaks
			coolreader

			# GNOME extensions
		];
	};

	virtualisation.docker.enable = true;

	programs.dconf.enable = true;

	system.stateVersion = "22.05"; 
}
