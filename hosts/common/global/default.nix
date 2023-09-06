# Global config which is used on all hosts

{ inputs, pkgs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager
        ./auto-upgrade.nix
        ./grub.nix
        ./nix.nix
    ];

    home-manager.extraSpecialArgs = { inherit inputs; };

    nixpkgs = {
        config = {
            allowUnfree = true;
        };
    };

    services.dbus.enable = true;

    networking = {
        domain = "cimbulka.net";

        hosts = {
            "192.168.50.5" = [ "odroid-n2" ];
            "192.168.50.6" = [ "odroid-m1" ];
        };
    };
        
    
    time.timeZone = "Europe/Prague";
    fonts = {
        fontconfig.enable = true;

        packages = with pkgs; [
            nerdfonts
        ];
    };

    environment = {
        enableAllTerminfo = true;

        systemPackages = with pkgs; [
            git
            psmisc
        ];
    };
}