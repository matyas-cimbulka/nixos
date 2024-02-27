{
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
                    retry_join = [ "192.168.50.5:4647" ];
                    retry_max = 3;
                    retry_interval = "15s";
                };
#                network_interface = "vlan10@end0";
            };

            consul = {
                address = "192.168.50.5:8500";
            };
        };
    };
}