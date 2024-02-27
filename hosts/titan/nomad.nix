{
    services.nomad = {
        enable = true;

        settings = {
            server = {
                enabled = true;
                bootstrap_expect = 1;
            };

            ui = {
                enabled = true;
            };

            client = {
                enabled = true;
                servers = [ "192.168.50.5" ];
#                network_interface = "vlan10@end0";
            };
        };
    };
}