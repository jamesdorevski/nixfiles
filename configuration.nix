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
			displayManager.gdm.enable = true;
			desktopManager.gnome.enable = true;
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
		blueman = {
			enable = true;
		};
	};

	sound.enable = true;
	hardware = {
		pulseaudio = {
			enable = false;
		};
		bluetooth = {
			enable = true;
			settings = {
				General = {
					ControllerMode = "bredr";
				};
			};
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
			mitschem
			dotnet-sdk
			go

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
			
			# gui
			spotify
			transmission-gtk
			vlc
			jetbrains.rider
			slack
			obsidian
			libreoffice
			gimp
			xournalpp
			prismlauncher
			zoom-us
			discord
			brave

			# GNOME extensions
			gnomeExtensions.tweaks-in-system-menu
		];
	};

	virtualisation.docker.enable = true;

	programs.dconf.enable = true;

	system.stateVersion = "22.05"; 
}
