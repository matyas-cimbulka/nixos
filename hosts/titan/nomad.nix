{
    services.nomad = {
        enable = true;

        enableDocker = true;
        dropPrivileges = false;

        settings = {
            datacenter = "homelab";

            bind_addr = "0.0.0.0";

            advertise = {
                http = "192.168.50.5";
                rpc = "192.168.50.5:4647";
                serf = "192.168.50.5";
            };

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

            consul = {
                address = "127.0.0.1:8500";
            };
        };
    };
}