{ config, lib, pkgs, ... }:

{
  users.users.ryan = {
	isNormalUser = true;
	description = "dawg";
	extraGroups = [ "wheel" ];
	shell = pkgs.zsh;
	home = "/home/ryan";
  };
}
