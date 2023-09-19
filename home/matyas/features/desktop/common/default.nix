{ pkgs, ... }:

{
    imports = [
        ../../proton
    ];

    home.packages = with pkgs; [
        google-chrome
        vscode
        plex-media-player
        protonvpn-gui
    ];
}