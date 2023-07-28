# Global config which is used on all hosts

{ inputs, ... }:

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

    networking.domain = "cimbulka.net";

    environment.enableAllTerminfo = true;
    time.timeZone = "Europe/Prague";
}