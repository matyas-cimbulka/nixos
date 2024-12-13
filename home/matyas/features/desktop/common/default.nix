{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # _1password-gui-beta
        google-chrome
        yubioath-flutter
    ];
}
