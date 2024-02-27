{
    services.nomad = {
        enable = true;

        settings = {
            client = {
                enabled = true;
                servers = [ "192.168.50.5" ];
#                network_interface = "vlan10@end0";
            };
        };
    };
}