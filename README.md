# Nixfiles

Contains my system configuration and home config for [NixOS](https://nixos.org/).

## NixOS System Configuration

### Building 

#### Prerequisites 

1. Add [Home Manager](https://nix-community.github.io/home-manager/index.html#sec-install-nixos-module) channel for applicable NixOS version
2. Add [NixOS Hardware](https://github.com/NixOS/nixos-hardware#setup) channel for applicable NixOS version
3. Replace nixos-hardware import with the corresponding profile for your hardware: [List of profiles](https://github.com/NixOS/nixos-hardware#list-of-profiles)
4. Add symlink from `./configuration.nix` to `/etc/nixos/configuration.nix`

#### Steps

1. Run the following command:

```shell
nixos-rebuild switch
```

## Home Manager Configuration 

### Building

#### Prerequisties

1. Add symlink from `./home-manager` to `$HOME/.config/home-manager`
2. Ensure `home-manager` executable is available

#### Steps

1. Run the following command:

```shell
home-manager build
```

