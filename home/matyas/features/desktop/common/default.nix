{ pkgs, ... }:

{
    home.packages = with pkgs; [
        anytype
        _1password-gui-beta

        google-chrome
        yubioath-flutter
        warp-terminal
    ];
}
