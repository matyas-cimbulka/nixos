{ inputs, lib, pkgs, config, ... }:
let
    inherit (inputs.nix-colors) colorSchemes;
    inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) colorschemeFromPicture nixWallpaperFromScheme;
in
{
    imports = [
        inputs.nix-colors.homeManagerModule

        ../features/cli
        ../features/helix
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

    programs.home-manager.enable = true;

    home = {
        username = lib.mkDefault "matyas";
        homeDirectory = lib.mkDefault "/home/matyas";
        stateVersion = lib.mkDefault "23.05";
        sessionPath = [ "$HOME/.local/bin" ];
    };

    colorscheme = lib.mkDefault colorSchemes.material;
    home.file.".colorscheme".text = config.colorscheme.slug;
}