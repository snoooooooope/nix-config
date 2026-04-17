{ pkgs, ... }:

{
  programs.dconf.enable = true;
  fonts.packages = with pkgs; [
   nerd-fonts.symbols-only
 ];

  environment.systemPackages = with pkgs; [
    nwg-look
    kdePackages.breeze-gtk
    rose-pine-icon-theme
  ];

  environment.sessionVariables = {
    GTK_THEME = "Breeze-Dark";
    XDG_ICON_THEME = "rose-pine-dawn";
    QT_STYLE_OVERRIDE = "breeze-dark";
  };
} 
