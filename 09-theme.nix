{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
  ];
  
  environment.systemPackages = with pkgs; [
    kdePackages.breeze-gtk
    rose-pine-icon-theme
    rose-pine-hyprcursor
  ];

  environment.sessionVariables = {
    GTK_THEME = "Breeze-Dark";

    XDG_ICON_THEME = "rose-pine-dawn";
  };

  programs.dconf.enable = true;
  environment.sessionVariables.QT_STYLE_OVERRIDE = "breeze-dark";
}
