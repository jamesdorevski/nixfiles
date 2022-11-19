# Edit this configuration file to define what should be installed on # your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).
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
			displayManager.sddm.enable = true;
			desktopManager.plasma5.enable = true;
			layout = "au";
			xkbVariant = "";
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
	hardware.pulseaudio.enable = false;
	hardware.bluetooth.enable = true;
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
		systemPackages = with pkgs; [
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
			helix
			dotnet-sdk
			mono

			# gui
			spotify
			google-chrome
			transmission-gtk
			vlc
			gnome.gnome-tweaks
			jetbrains.rider
			slack
			obsidian
			libreoffice
			gimp
			xournalpp
			prismlauncher
			zoom-us
			discord
		];
	};

	virtualisation.docker.enable = true;

	system.stateVersion = "22.05"; 
}
