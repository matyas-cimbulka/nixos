{ pkgs, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        
        ../common/global
        ../common/users/matyas

        ../common/optional/gnome.nix
        ../common/optional/smartcards.nix
        ../common/optional/nvidia.nix
        ../common/optional/pipewire.nix
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
    };

    services = {
        xserver = {
            enable = true;
            layout = "us";
        };

        printing.enable = true;
        flatpak.enable = true;
    };

    # Windows clock
    time.hardwareClockInLocalTime = true;

    system.stateVersion = "23.05";
}
