{ config, pkgs, ... }:

{
  home.username = "james";
  home.homeDirectory = "/home/james";

  home.file.".config/fish/config.fish".source = ./config.fish;

  programs.git = {
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

  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
}
