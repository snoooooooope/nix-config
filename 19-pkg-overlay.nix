{ pkgs, ... }:

{
 nixpkgs.overlays = [
     (import ./overlays/local-overlay.nix)
 ];
}
