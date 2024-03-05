{
    imports = [
        ../common/optional/consul.nix
    ];

    services.consul = {
        extraConfig = {
            node_name = "europa";
            server = false;

            advertise_addr = "10.0.10.3";

            retry_join = [
                "10.0.10.2:8301"
            ];
        };
    };
}