{
    services.nomad = {
        enable = true;

        settings = {
            server = {
                enabled = true;
                bootstrap_expect = 2;

                server_join = {
                    retry_join = [ "192.168.50.5" "192.16.50.6" ];
                    retry_max = 3;
                    retry_interval = "15s";
                };
            };

            ui = {
                enabled = true;
            };

            client = {
                enabled = true;
                servers = [ "192.168.50.5" "192.16.50.6" ];
#                network_interface = "vlan10@end0";
            };
        };
    };
}