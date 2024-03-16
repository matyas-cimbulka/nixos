{ lib, config, pkgs, ... }:
with lib;
let
    cfg = config.modules.nomad;
in {
    options.modules.nomad = {
        enable = mkEnableOption "Enable Nomad module";

        openFirewall = mkOption {
            type = types.bool;
            default = false;
        };

        ui = mkOption {
            type = types.bool;
            default = false;
        };
    };

    config = mkIf cfg.enable {
        networking.firewall.allowedTCPPorts = mkIf cfg.openFirewall [
            4646
            4647
            4648
        ];

        environment = {
            etc."nomad".source = ./configs;

            systemPackages = with pkgs; [ cni-plugins ];
        };

        services.nomad = {
            enable = true;

            enableDocker = true;
            dropPrivileges = false;
            
            extraPackages = with pkgs; [ consul ];
            extraSettingsPaths = [ "/etc/nomad" ];

            settings = {
                datacenter = "homelab";
                data_dir = "/opt/nomad";

                bind_addr = "0.0.0.0";

                client = {
                    enabled = true;
                    cni_path = "${pkgs.cni-plugins}/bin";
                };

                ui = {
                    enabled = cfg.ui;
                };
            };
        };
    };
}