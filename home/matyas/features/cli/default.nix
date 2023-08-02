{ pkgs, ... }:

{
    imports = [
        ./gpg
        ./zsh
        
        ./btop.nix
        ./exa.nix
        ./git.nix
        ./zellij.nix
    ];

    home.packages = with pkgs; [
        vim
        ncdu
    ];

    programs.ripgrep.enable = true;
}