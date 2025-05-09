{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.amd-gpu;
in {
  options.modules.amd-gpu = {
    enable = mkEnableOption "enable AMD GPU config";
  };

  config = mkIf cfg.enable {
    boot.initrd.kernelModules = [ "amdgpu" ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}