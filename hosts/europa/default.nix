{ pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/docker.nix
        ../common/optional/sshd.nix
        ../common/optional/fonts.nix
    ];

	boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
    };

    networking = {
        hostName = "europa";
        networkmanager.enable = true;

        # hosts = [
        #
        # ];
    };

    services.xserver = {
        enable = true;
        xkb.layout = "us";
    };

    system.stateVersion = "24.05";
}