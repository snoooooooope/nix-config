{ config, lib, pkgs, ... }:

{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		fuzzel
		wl-clipboard
	];

	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
