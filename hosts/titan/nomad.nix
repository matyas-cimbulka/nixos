{ pkgs, ... }:

{
    networking.firewall.allowedTCPPorts = [
        4646
        4647
        4648
    ];

    environment = {
        etc."nomad".source = ../common/nomad;

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

            advertise = {
                http = "10.0.10.2";
                rpc = "10.0.10.2:4647";
                serf = "10.0.10.2";
            };

            server = {
                enabled = true;
                bootstrap_expect = 1;
            };

            ui = {
                enabled = true;
            };

            client = {
                enabled = true;
                servers = [ "10.0.10.2" ];
                cni_path = "${pkgs.cni-plugins}/bin";
            };

            consul = {
                address = "127.0.0.1:8505";
            };
        };
    };
}