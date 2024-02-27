{
    services.nomad = {
        enable = true;

        settings = {
            datacenter = "homelab";

            bind_addr = "0.0.0.0";

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