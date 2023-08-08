{ pkgs, ... }:

{
    home.packages = with pkgs; [
        bitwarden
        google-chrome
        vscode
        plex-media-player
    ];
}