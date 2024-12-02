{ pkgs, ... }:
{
    programs.alacritty.enable = true; # TODO move alacritty to separate file and configure settings

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
