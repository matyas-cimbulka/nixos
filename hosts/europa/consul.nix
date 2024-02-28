{
    services.consul = {
        enable = true;
        dropPrivileges = false;

        webUi = true;

        extraConfig = {
            node_name = "europa";
            server = false;
            datacenter = "homelab";

            advertise_addr = "10.0.10.3";
            bind_addr = "0.0.0.0";

            addresses = {
                http = "0.0.0.0";
            };

            retry_join = [
                "10.0.10.2:8301"
            ];

            encrypt = "b1XsNgdcXXT+8kHI7tvRwpN3wp//A283wU6qVu4FmP0=";
            encrypt_verify_incoming = false;
            encrypt_verify_outgoing = false;
        };
    };
}