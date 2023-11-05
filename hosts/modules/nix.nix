{ lib, config, inputs, ... }:
with lib;
let
  cfg = config.utils.nix;
in {
  options.utils.nix = {
    enable = mkEnableOption "enable nix config";

    allowUnfree = mkOption {
      type = types.bool;
      default = true;
    };

    autoOptimise = mkOption {
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
        trusted-user = [ "root" "@wheel" ];
        auto-optimise-store = cfg.autoOptimise;
        experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      };

      gc = mkIf cfg.garbageCollection {
          automatic = true;
          dates = "weakly";
          options = "--delete-older-then 15d";
      };

      registry = mapAttrs (_: value: { flake = value; }) inputs;
      nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
    };

    nixpkgs.config.allowUnfree = cfg.allowUnfree;
  };
}