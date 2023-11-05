{ lib, config, ... }:
with lib;
let
  cfg = config.utils.networking;
in {
  options.utils.networking = {
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

      hosts = {
        "192.168.50.2" = [ "nas-1" ];
        "192.168.50.5" = [ "titan" ];
        "192.168.50.6" = [ "europa" ];
        "100.75.74.38" = [ "titan.tailnet" ];
        "100.106.236.108" = [ "europa.tailnet" ];
      };
    };
  };
}