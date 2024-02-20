{
    imports = [
        ./hardware-configuration.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/docker
    ];

    boot.loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
    };

    networking = {
        hostName = "europa";
        networkmanager.enable = true;

        hosts = [

        ];
    };

    services.xserver.xkb.layout = "us";

    system.stateVersion = "24.05";
}