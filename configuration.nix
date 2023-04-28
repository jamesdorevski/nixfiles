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
			tldr
			ranger
			tree
			jump
			dive
			sox
			zip 
			unzip
			android-tools
			android-udev-rules

			# gui
			google-chrome
			firefox
			spotify
			transmission-gtk
			vlc
			slack
			obsidian
			libreoffice
			gimp
			discord
			coolreader
			android-studio
			gnome.gnome-tweaks	

			# gnome extensions
			gnomeExtensions.emoji-selector
		 	gnomeExtensions.clipboard-indicator
			gnomeExtensions.caffeine
		];
	};

	virtualisation.docker.enable = true;

	programs.dconf.enable = true;

	system.stateVersion = "22.05"; 
}
