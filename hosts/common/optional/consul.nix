{
    networking.firewall.allowedTCPPorts = [
        8301
        8500
        8501
        8502
        8503
        8600
    ];

    systemd.services.consul.environment = {
        HOME = "/root";
    };

    services.consul = {
        enable = true;
        dropPrivileges = false;

        extraConfig = {
            datacenter = "homelab";
            data_dir = "/opt/consul";

            bind_addr = "0.0.0.0";

            addresses = {
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
}