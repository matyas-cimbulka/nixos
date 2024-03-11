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

            openssh.authorizedKeys.keys = [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiVB4pD9gll/GGNvxzQ0gkeUDAunOaWbrwSNYYzkO4FbNkl66QHxiY6nGtZizlJ05KFKfZgpxJ4onaSe2EqwDgJHSfd0Wt60yrGg5MCrmgfLCIKy4GFUDaX5cHDtxiJql2QDvkw0xBXmXgh3IeV3MU99cdY8zK6USrilcWPdloaK7/c047yjjhTbKvZhjtxn92Vw+P7XGjTwzM9nIOsjwVXnx27BNuOd7phMaiZBp2ePIXha2LqATK28KIqMYxXdfFUTmXyStnsTWh608+/xMQQZ4T10EDj8lRv29VYA7FMt1mwxx3K6CIomgj4KkguRZcQCNbJZhoylM/TI4+UcGp openpgp:0x2CB1C855"
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbEwfeLmkzzFfvg3ehaHPN/OaJyEzRlp26h+UAeRGSN/Ime5Gw+qi0YiRX4jOdOtxbZ7m5S9+C++LBfxUPG4lNcjtYVjYH5NcCFSO9PsQohyLhAP3i7bU6BYPSbCCKwYMRSjEfq3gPbU5v0/Q4XVp8oh05+ea83SeZ+Dla37o6RZAN3bDd4FlVEQ3Rf7zXBivQCrRT4MGHTIEkhCKEZayETSi+01z5uxlfE1Q6iUjjdLsx3sCVTYCzbVMEI6ejZeC44X3ut5PzEG+o2mbmsiymvbFBWtVrBpTrTTcmraXyDYJWqk0OZmyKid1BttuZuloGE6iGvhm6B/7qmVBi+aPH openpgp:0x75525633"
            ];
        };
    };

    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ];

    home-manager.users.admin = import ../../../../home/admin/${config.networking.hostName}.nix;
}