{ pkgs, ... }:

{
    imports = [
        ./gpg
        ./zsh
        
        ./git.nix
        ./zellij.nix
    ];

    home.packages = with pkgs; [
        vim
        btop
        ncdu
        exa
        ripgrep
    ];
}