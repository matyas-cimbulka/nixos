{ inputs, lib, pkgs, config, ... }:

{
    imports = [
        ../features/cli
        ../feauters/helix
    ];

    nixpkgs = {
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };
    };

    nix = {
        package = lib.mkDefault pkgs.nix;
        settings = {
            experimental-features = [ "nix-command" "flakes" "repl-flake" ];
            warn-dirty = false;
        };
    };

    home = {
        username = lib.mkDefault "admin";
        homeDirectory = lib.mkDefault "/home/admin";
        stateVersion = lib.mkDefault "23.05";
        sessionPath = [ "$HOME/.local/bin" ];

        packages = with pkgs; [
            home-manager
        ];
    };
}