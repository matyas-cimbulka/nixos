{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
    users = {
        users.matyas = {
            isNormalUser = true;
            description = "Matyas Cimbulka";
            shell = pkgs.zsh;
            extraGroups = [
                "wheel"
                "video"
                "audio"
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

    home-manager.users.matyas = import ../../../home/matyas/${config.utils.networking.hostName}.nix;
}