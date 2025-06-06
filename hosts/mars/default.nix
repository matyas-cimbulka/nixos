{ pkgs, ... }:

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
        amd-gpu.enable = true;
        gnome.enable = true;
        sound.enable = true;
        smartcards.enable = true;
        steam.enable = true;
        docker.enable = true;

        nix = {
            enable = true;
            garbageCollection = true;
        };

        grub = {
            enable = true;
            dualBoot = true;
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

        # ollama = {
        #     enable = true;
        #     package = pkgs.ollama-cuda;
        #     acceleration = "cuda";

        #     loadModels = [
        #         "llama3.2"
        #         "codestral"
        #     ];
        # };
    };

    home-manager.users.matyas = import ../../home/matyas/mars.nix;

    # Windows clock compatibility
    # time.hardwareClockInLocalTime = true;

    system.stateVersion = "23.05";
}
