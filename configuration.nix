# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./00-env.nix
      ./01-services.nix
      ./02-user.nix
      ./08-audio.nix
      ./09-theme.nix
      ./10-pkg-shell.nix
      ./11-pkg-base.nix
      ./12-pkg-hyprland.nix
      ./90-git.nix
      ./91-mercurial.nix
      ./92-jj.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nix.settings.auto-optimise-store = true; 

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}

