{
    networking.firewall.allowedTCPPorts = [
        4646
        4647
        4648
    ];

    services.nomad = {
        enable = true;

        enableDocker = true;
        dropPrivileges = false;

        settings = {
            datacenter = "homelab";

            bind_addr = "0.0.0.0";

            client = {
                enabled = true;
                server_join = {
                    retry_join = [ "10.0.10.2:4647" ];
                    retry_max = 3;
                    retry_interval = "15s";
                };
            };
        };
    };
}