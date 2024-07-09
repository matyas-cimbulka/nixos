{ lib, config, ... }:
with lib;
let
  cfg = config.modules.nvidia;
in {
  options.modules.nvidia = {
    enable = mkEnableOption "enable nvidia config";
    prime = mkOption {
      type = types.bool;
      default = false;
    };
    intelBusId = mkOption {
      type = types.str;
      default = "";
    };
    nvidiaBusId = mkOption {
      type = types.str;
      default = "";
    };
  };

  config = mkIf cfg.enable {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        nvidiaSettings = true;

        prime = mkIf cfg.prime {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };

          intelBusId = cfg.intelBusId;
          nvidiaBusId = cfg.nvidiaBusId;
        };
      };
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}