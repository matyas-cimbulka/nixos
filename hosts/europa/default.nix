{ pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/docker.nix
        ../common/optional/sshd.nix
    ];

	boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
    };

    networking = {
        hostName = "europa";
        networkmanager.enable = true;

        hosts = {
            "192.168.50.2" = [ "nas-1" ];
            "192.168.50.5" = [ "titan" ];
        };
    };

    services.xserver = {
        enable = true;
        xkb.layout = "us";
    };

    system.stateVersion = "24.05";
}