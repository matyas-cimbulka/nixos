{ pkgs, ... }:

{
    imports = [
        ../common
    ];

    home.packages = with pkgs; [
        gnome.gedit
        gnome.gnome-tweaks
        
        gnomeExtensions.appindicator
        gnomeExtensions.search-light
        gnomeExtensions.blur-my-shell
        gnomeExtensions.just-perfection
        gnomeExtensions.dash-to-dock
    ];
}