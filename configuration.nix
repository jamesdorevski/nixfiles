# Edit this configuration file to define what should be installed on # your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  	imports = [  
		./hardware-configuration.nix
      	<home-manager/nixos>
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
			displayManager.gdm.enable = true;
			desktopManager.gnome.enable = true;
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
	security.rtkit.enable = true;
  	
	users.users.james = {
   		isNormalUser = true;
    	description = "James Dorevski";
    	extraGroups = [ 
			"networkmanager" 
			"wheel" 
		];
    	# shell = pkgs.fish;
  	};

	nixpkgs.config.allowUnfree = true;

	environment = {
		systemPackages = with pkgs; [
			# cli
			neovim
			tmux
			direnv

			# gui
			spotify
			firefox
			vscode
			transmission-gtk
			vlc
			gnome.gnome-tweaks
			jetbrains.rider
			alacritty
			tor-browser-bundle-bin
		];
	};

	system.stateVersion = "22.05"; 
}
