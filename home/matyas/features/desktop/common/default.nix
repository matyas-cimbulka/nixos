{ pkgs, ... }:

{
    home.packages = with pkgs; [
        anytype
        
        google-chrome
        yubioath-flutter
        warp-terminal
    ];
}