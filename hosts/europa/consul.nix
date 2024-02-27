{
    services.consul = {
        enable = true;

        interface = {
            bind = "0.0.0.0";
        };

        webUi = true;

        extraConfig = {
            node_name = "europa";
            server = true;
            datacenter = "homelab";

            data_dir = "/mnt/ssd/volumes/consul/europa/";

            addresses = {
                http = "0.0.0.0";
            };

            encrypt = "b1XsNgdcXXT+8kHI7tvRwpN3wp//A283wU6qVu4FmP0=";
        };
    };
}