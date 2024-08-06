{ pkgs, ... }:

{
    imports = [
        ../common
    ];

    home.packages = with pkgs; [
        gedit
        gnome-tweaks
        
        gnomeExtensions.appindicator
        gnomeExtensions.search-light
        gnomeExtensions.blur-my-shell
        gnomeExtensions.just-perfection
        gnomeExtensions.dash-to-dock
        gnomeExtensions.forge
        gnomeExtensions.vitals
        gnomeExtensions.fly-pie
    ];
}