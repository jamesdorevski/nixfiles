{ config, pkgs, ... }:
{
  	imports = [  
		/etc/nixos/hardware-configuration.nix	 
		<home-manager/nixos>
		<nixos-hardware/lenovo/thinkpad/t14/amd/gen2>
 	];

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot";
			};
		};
        kernelModules = [ 
            "i2c-dev" 
        ];
	};

	networking = {
		hostName = "nixos";
		networkmanager.enable = true;
	};

  	time.timeZone = "Australia/Sydney";
  	i18n.defaultLocale = "en_AU.utf8";
		
	services = {
        udev.extraRules = ''
            KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
        '';
		xserver = {
			enable = true;
			layout = "au";
			displayManager.gdm.enable = true;
			desktopManager.gnome.enable = true;
		};
		xrdp = {
			enable = true;
			defaultWindowManager = "gnome-session";
			openFirewall = true;
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
 	   	extraGroups = [ 
			"networkmanager" 
			"wheel" 
			"docker"
            "i2c"
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
			tree
			jump
			dive
			sox
			zip 
			unzip
			gh
			ranger
            ddcutil

			# gui
            firefox
			google-chrome
			spotify
			transmission-gtk
			vlc
			slack
			obsidian
			libreoffice
			gimp
			discord
			android-studio
            thunderbird
            foliate
			gnome.gnome-tweaks
			gnome.gnome-chess
			stellarium

			# gnome extensions
			gnomeExtensions.emoji-selector
		 	gnomeExtensions.clipboard-indicator
			gnomeExtensions.caffeine
            gnomeExtensions.todotxt
            gnomeExtensions.brightness-control-using-ddcutil
		];
	};

	virtualisation.docker.enable = true;

	programs.dconf.enable = true;

	system.stateVersion = "22.05"; 
}
