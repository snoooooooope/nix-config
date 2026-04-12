{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.jujutsu ];

  environment.etc."jj/config.toml".text = ''
    [user]
    name = "Ryan S."
    email = "bootnull@proton.me"

    [ui]
    editor = "hx"

    [signing]
    sign-all = false
    backend = "none"

    [git]
    push-branch-prefix = "ryan/jj-"
  '';
}
