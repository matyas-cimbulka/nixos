{
    networking.firewall.allowedTCPPorts = [
        8300
        8301
        8302
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

        webUi = true;

        extraConfig = {
            node_name = "titan";
            server = true;
            bootstrap_expect = 1;
            datacenter = "homelab";
            data_dir = "/opt/consul";

            advertise_addr = "10.0.10.2";
            bind_addr = "0.0.0.0";

            addresses = {
                http = "0.0.0.0";
            };

            encrypt = "b1XsNgdcXXT+8kHI7tvRwpN3wp//A283wU6qVu4FmP0=";
            encrypt_verify_incoming = false;
            encrypt_verify_outgoing = false;
        };
    };
}
