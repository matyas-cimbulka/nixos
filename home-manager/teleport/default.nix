{ config, pkgs, ... }:

{
    home = {
        packages = [ pkgs.teleport ];

        file = {
            ssh-config = {
                enable = true;
                source = ./ssh-config
                target = "${config.home.homeDirectory}/.ssh/config"
            }
        }
    }
}