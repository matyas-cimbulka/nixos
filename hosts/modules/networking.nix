{ lib, config, ... }:
with lib;
let
  cfg = config.modules.networking;
in {
  options.modules.networking = {
    enable = mkEnableOption "enable network configuration";
    hostName = mkOption {
      type = types.str;
    };
    domain = mkOption {
      type = types.str;
      default = "cimbulka.net";
    };
  };

  config = mkIf cfg.enable {
    networking = {
      hostName = cfg.hostName;
      domain = cfg.domain;
      networkmanager.enable = true;
    };
  };
}