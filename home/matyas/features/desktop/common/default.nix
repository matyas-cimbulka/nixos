{ pkgs, ... }:
{
    home.packages = with pkgs; [
        _1password-gui
        google-chrome
        yubioath-flutter
        gitbutler
    ];
}
