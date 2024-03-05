{ pkgs, ... }:

{
    home.packages = with pkgs; [
        anytype
        
        google-chrome
        warp-terminal
    ];
}