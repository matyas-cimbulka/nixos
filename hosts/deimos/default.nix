{
    imports = [
        ./hardware-configuration.nix
        
        ../modules
        ../profiles/users/matyas.nix
        ../profiles/desktop
    ];

    fileSystems = {
        "/".options = [ "compress=zstd:3" ];
        "/home".options = [ "compress=zstd:6" ];
        "/nix".options = [ "compress=zstd:6 noatime" ];
    };

    modules = {
        autoUpgrade.enable = true;
        sound.enable = true;
        smartcards.enable = true;
        kde.enable = true;

        nix = {
            enable = true;
            garbageCollection = true;
        };

        grub = {
            enable = true;
            dualBoot = true;
        };

        nvidia = {
            enable = true;

            prime = true;
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };

        networking = {
          enable = true;
          hostName = "mars";
          domain = "cimbulka.net";
        };
    };

    networking.hosts = {
        "192.168.50.2" = [ "nas-1" ];
        "192.168.50.5" = [ "titan" ];
        "192.168.50.6" = [ "europa" ];
    };

    services = {
        xserver = {
            enable = true;
            xkb.layout = "us";
        };

        printing.enable = true;
        flatpak.enable = true;
    };

    home-manager.users.matyas = import ../../home/matyas/deimos.nix;

    system.stateVersion = "23.05";
}
