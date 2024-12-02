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
    nm-applet = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    programs.nm-applet.enable = cfg.nm-applet;
    
    networking = {
      hostName = cfg.hostName;
      domain = cfg.domain;
      networkmanager.enable = true;
    };
  };
}