{ pkgs, ... }:

{
    home.packages = with pkgs; [
        google-chrome
        plex-media-player
    ];
}