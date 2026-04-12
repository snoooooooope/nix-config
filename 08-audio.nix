{ pkgs, ... }:

{
  services.pipewire = {
    enable = true;

    package = pkgs.pipewire;

    wireplumber = {
      enable = true;
    };
  };
  security.rtkit.enable = true;
}
