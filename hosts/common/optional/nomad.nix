{
    services.nomad = {
        enable = true;

        settings = {
            server = {
                enabled = true;
                bootstrap_expect = 2;
            };

            client = {
                enabled = true;
                servers = [ "10.0.10.2" "10.0.10.3" ];
                network_interface = "vlan10@end0";
            };
        };
    };
}