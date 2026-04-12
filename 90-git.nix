{ config, pkgs, ... }:

{
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
}
