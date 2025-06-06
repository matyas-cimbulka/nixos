{ inputs, lib, pkgs, config, ... }:

{
    imports = [
        ../features/cli
        ../features/helix

        ../features/notes
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
            experimental-features = [ "nix-command" "flakes" ];
            warn-dirty = false;
        };
    };

    programs.home-manager.enable = true;

    home = {
        username = lib.mkDefault "matyas";
        homeDirectory = lib.mkDefault "/home/matyas";
        stateVersion = lib.mkDefault "23.05";
        sessionPath = [ "$HOME/.local/bin" ];
    };
}