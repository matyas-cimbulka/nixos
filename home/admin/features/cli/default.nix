{ pkgs, ... }:

{
    imports = [
        ./zsh
        
        ./bat.nix
        ./bottom.nix        
        ./btop.nix
        ./exa.nix
        ./git.nix
        ./ssh.nix
        ./zellij.nix
    ];

    home.packages = with pkgs; [
        vim
        ncdu
    ];

    programs.ripgrep.enable = true;
}