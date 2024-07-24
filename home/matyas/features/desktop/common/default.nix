{ pkgs, ... }:

{
    home.packages = with pkgs; [
        anytype
        _1password-gui-beta

        gitbutler
        google-chrome
        yubioath-flutter
        warp-terminal
    ];
}
