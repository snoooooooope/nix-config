{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    wget
    helix
    bat
    btop
    fastfetch
    ouch
    starship
    ripgrep
    ffmpeg
    zen-browser
  ];

  programs.foot = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      main = {
        shell = "zsh";
      };
      colors = {
        alpha = "1.0";
        background = "0a0e14";
        foreground = "c7cfff";

        regular0 = "242937";
        regular1 = "ff6e5e";
        regular2 = "5eff6c";
        regular3 = "f1ff5e";
        regular4 = "5ea1ff";
        regular5 = "ff5ea0";
        regular6 = "5ef1ff";
        regular7 = "c7cfff";

        bright0 = "242937";
        bright1 = "ff6e5e";
        bright2 = "5eff6c";
        bright3 = "f1ff5e";
        bright4 = "5ea1ff";
        bright5 = "ff5ea0";
        bright6 = "5ef1ff";
        bright7 = "ffffff";
      };
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
