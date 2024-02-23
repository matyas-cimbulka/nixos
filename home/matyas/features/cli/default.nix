{ pkgs, ... }:

{
    imports = [
        ./gpg
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
        jq

        openssh
    ];

    programs = {
        # ssh.enable = true;
        ripgrep.enable = true;
    };
}