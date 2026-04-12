{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jujutsu
    mercurial
  ];

  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Ryan S.";
        email = "bootnull@proton.me";
      };

      commit.gpgsign = false;
      tag.gpgsign = false;
      gpg.format = "ssh";
      
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };
  };

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
