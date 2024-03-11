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

    utils = {
        autoUpgrade.enable = true;
        nix.enable = true;
        nvidia.enable = true;
        sound.enable = true;

        grub = {
            enable = true;
            dualBoot = true;
        };

        networking = {
          hostName = "mars";
          domain = "cimbulka.net";
        };
    };

    services = {
        xserver = {
            enable = true;
            xkb.layout = "us";
        };

        printing.enable = true;
        flatpak.enable = true;
        gnome.enable = true;
        smartcards.enable = true;
    };

    # Windows clock compatibility
    # time.hardwareClockInLocalTime = true;

    system.stateVersion = "23.05";
}
