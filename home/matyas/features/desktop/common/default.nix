{ pkgs, ... }:

{
    home.packages = with pkgs; [
        google-chrome
        warp-terminal
    ];
}