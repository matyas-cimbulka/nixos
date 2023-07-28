{ inputs, lib, ... }:

{
    nix = {
        settings = {
            trusted-users = [ "root" "@wheel" ];
            auto-optimise-store = lib.mkDefault true;
            experimental-features = [ "nix-command" "flakes" "repl-flake" ];
        };
        gc = {
            automatic = true;
            dates = "weakly";
            options = "--delete-older-then 2d";
        };

        registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
        nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
    };
}