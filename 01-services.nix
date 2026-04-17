{ ... }:

{
  networking.networkmanager.enable = true;
  services.xserver.xkb.layout = "us";
  services.displayManager.ly.enable = true;
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
