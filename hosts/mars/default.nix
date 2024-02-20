{
    imports = [
        ./hardware-configuration.nix
        
        ../common/global
        ../common/users/matyas

        ../common/optional/grub.nix
        ../common/optional/gnome.nix
        ../common/optional/smartcards.nix
        ../common/optional/steam.nix
        ../common/optional/nvidia.nix
        ../common/optional/pipewire.nix
        ../common/optional/docker.nix
        ../common/optional/tailscale.nix
    ];

    boot.loader.grub = {
        useOSProber = true;
        default = "saved";
    };

    fileSystems = {
        "/".options = [ "compress=zstd:3" ];
        "/home".options = [ "compress=zstd:6" ];
        "/nix".options = [ "compress=zstd:6 noatime" ];
    };

    networking = {
        hostName = "mars";
        networkmanager.enable = true;

        hosts = {
            "192.168.50.2" = [ "nas-1" ];
            "192.168.50.5" = [ "titan" ];
            "192.168.50.6" = [ "europa" ];
            "100.75.74.38" = [ "titan.tailnet" ];
            "100.106.236.108" = [ "europa.tailnet" ];
        };
    };

    services = {
        xserver = {
            enable = true;
            xkb.layout = "us";
        };

        printing.enable = true;
        flatpak.enable = true;
    };

    # Windows clock
    # time.hardwareClockInLocalTime = true;

    system.stateVersion = "23.05";
}
