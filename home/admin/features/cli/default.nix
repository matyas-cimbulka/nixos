{ pkgs, ... }:

{
    imports = [
        ./zsh
        
        ./bat.nix
        ./bottom.nix        
        ./btop.nix
        ./exa.nix
        ./git.nix
        ./zellij.nix
        ./zoxide.nix
    ];

    home.packages = with pkgs; [
        vim
        ncdu
    ];

    programs.ripgrep.enable = true;
}