{ config, lib, pkgs, ... }:

{
  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  time.timeZone = "US/Eastern";
  networking.hostName = "nixos";
  environment.variables = {
    EDITOR = "hx";
  };
}
