{ pkgs, ... }:

{
    imports = [
        ./fish
        ./gpg
        ./zsh
        
        ./bat.nix
        ./bottom.nix        
        ./btop.nix
        ./consul.nix
        ./exa.nix
        ./git.nix
        ./nomad.nix
        ./starship.nix
        ./zellij.nix
        ./zoxide.nix
    ];

    home.packages = with pkgs; [
        vim
        ncdu
        jq

        openssh

        _1password-cli
    ];

    programs = {
        # ssh.enable = true;
        ripgrep.enable = true;
    };
}