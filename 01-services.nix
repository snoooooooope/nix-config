{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  services.xserver.xkb.layout = "us";
  programs.ssh = {
    startAgent = false;

    extraConfig = ''
      Host *
        IdentityFile ~/.ssh/id_ed25519
        IdentitiesOnly yes
        ForwardAgent no
        '';
    };
}
