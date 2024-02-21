{ pkgs, ... }:

{
    imports = [
        ../common
    ];

    home.packages = with pkgs; [
        blackbox-terminal

        gedit
        gnome.gnome-tweaks
        
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