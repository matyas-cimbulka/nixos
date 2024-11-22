{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # anytype
        # _1password-gui-beta
        blackbox-terminal
        # gitbutler
        google-chrome
        yubioath-flutter
        # warp-terminal
    ];
}
