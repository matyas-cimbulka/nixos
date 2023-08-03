{ pkgs, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../common/global
        ../common/users/matyas

        ../common/optional/hyprland.nix
        ../common/optional/gpg.nix
        ../common/optional/nvidia.nix
        ../common/optional/pipewire.nix
    ];

    fileSystems = {
        "/".options = [ "compress=zstd:3" ];
        "/home".options = [ "compress=zstd:6" ];
        "/nix".options = [ "compress=zstd:6 noatime" ];
    };

    networking = {
        hostName = "deimos";
        networkmanager.enable = true;
    };

    services = {
        xserver = {
           enable = true;
           layout = "gb";
           libinput.enable = true; 
        };

        printing.enable = true;
        flatpak.enable = true;
    };

    hardware.nvidia.prime = {
        offload = {
            enable = true;
            enableOffloadCmd = true;
        };
                
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
    };

    system.stateVersion = "23.05";
}