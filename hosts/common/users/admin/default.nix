{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
    users = {
        users.admin = {
            isNormalUser = true;
            description = "Administrator";
            shell = pkgs.zsh;
            extraGroups = [
                "wheel"
            ] ++ ifTheyExist [
                "network"
                "networkmanager"
                "docker"
                "podman"
                "git"
                "libvirtd"
            ];

            packages = [ pkgs.home-manager ];
        };
    };

    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ];

    home-manager.users.admin = import ../../../../home/admin/${config.networking.hostName}.nix;
}