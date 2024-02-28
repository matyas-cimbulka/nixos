{
    services.nomad = {
        enable = true;

        enableDocker = true;
        dropPrivileges = false;

        settings = {
            datacenter = "homelab";

            bind_addr = "0.0.0.0";

            advertise = {
                http = "10.0.10.2";
                rpc = "10.0.10.2:4647";
                serf = "10.0.10.2";
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
                servers = [ "10.0.10.2" ];
            };

            consul = {
                address = "127.0.0.1:8505";
            };
        };
    };
}