{ pkgs, ... }:

{
    home.packages = with pkgs; [
        fnm
        yarn
    ];
}