{ lib, config, ... }:
with lib;
let
    cfg = config.modules.consul;
in {
    options.modules.consul = {
        enable = mkEnableOption "Enable Consul module";

        openFirewall = mkOption {
            type = types.bool;
            default = false;
        };

        nodeName = mkOption {
            type = types.str;
            default = null;
        };

        ui = mkOption {
            type = types.bool;
            default = false;
        };
    };

    config = mkIf cfg.enable {
        systemd.services.consul.environment = {
            HOME = "/root/";
        };

        networking.firewall.allowedTCPPorts = mkIf cfg.openFirewall [
            8301
            8500
            8501
            8502
            8503
            8600
        ];
        
        services.consul = {
            enable = true;
            dropPrivileges = false;
            webUi = cfg.ui;

            extraConfig = {
                node_name = cfg.nodeName;
                datacenter = "homelab";
                data_dir = "/opt/consul";

                bind_addr = "0.0.0.0";

                address = {
                    http = "0.0.0.0";
                };

                ports = {
                    grpc = 8502;
                };

                encrypt = "b1XsNgdcXXT+8kHI7tvRwpN3wp//A283wU6qVu4FmP0=";
                encrypt_verify_incoming = false;
                encrypt_verify_outgoing = false;
            };
        };
    };
}