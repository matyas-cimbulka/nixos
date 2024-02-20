{
    imports = [
        ./hardware-configuration.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/docker.nix
    ];

    boot.loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
    };

    networking = {
        hostName = "titan";
        networkmanager.enable = true;

        # hosts = [
        #
        # ];
    };

    services.xserver.xkb.layout = "us";

    system.stateVersion = "24.05";
}