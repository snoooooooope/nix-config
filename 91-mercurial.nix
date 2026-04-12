{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.mercurial ];

  environment.etc."mercurial/hgrc".text = ''
    [ui]
    username = Ryan S. <bootnull@proton.me>
    editor = hx
    ssh = ssh

    [extensions]
    rebase = 
    absorb = 

    [gpg]
    sign = False
  '';
}
