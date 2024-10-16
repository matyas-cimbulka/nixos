{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.docker;
in {
  options.modules.docker = {
    enable = mkEnableOption "enable docker";
  };

  config = mkIf cfg.enable {
    virtualisation.docker = {
        enable = true;
        storageDriver = "btrfs";
    };
  };
}