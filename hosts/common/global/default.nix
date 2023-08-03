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

    networking.domain = "cimbulka.net";
    time.timeZone = "Europe/Prague";
    fonts = {
        fontconfig.enable = true;

        fonts = with pkgs; [
            nerdfonts
        ];
    };

    environment = {
        enableAllTerminfo = true;

        systemPackages = with pkgs; [
            git
        ];
    };
}