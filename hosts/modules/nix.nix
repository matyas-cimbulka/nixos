{ lib, config, inputs, ... }:
with lib;
let
  cfg = config.modules.nix;
in {
  options.modules.nix = {
    enable = mkEnableOption "enable nix config";

    allowUnfree = mkOption {
      type = types.bool;
      default = true;
    };

    garbageCollection = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    nix = {
      settings = {
        trusted-users = [ "root" "@wheel" ];
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];
      };

      gc = mkIf cfg.garbageCollection {
          automatic = true;
          dates = "daily";
          options = "--delete-older-then 7d";
      };

      registry = mapAttrs (_: value: { flake = value; }) inputs;
      nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
    };

    nixpkgs.config.allowUnfree = cfg.allowUnfree;
  };
}