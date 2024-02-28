{
    services.consul = {
        enable = true;
        dropPrivileges = false;

        webUi = true;

        extraConfig = {
            node_name = "europa";
            server = false;
            datacenter = "homelab";
            data_dir = "/mnt/ssd/volumes/consul/europa/";

            retry_join = [
                "10.0.10.2:8505"
            ];

            encrypt = "b1XsNgdcXXT+8kHI7tvRwpN3wp//A283wU6qVu4FmP0=";
        };
    };
}