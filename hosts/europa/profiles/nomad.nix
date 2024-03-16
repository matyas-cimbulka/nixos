{
    imports = [
        ../../modules/nomad
    ];

    modules.nomad = {
        enable = true;
        openFirewall = true;
    };

    services.nomad.settings = {
        client.server_join = {
            retry_join = [ "10.0.10.2:4647" ];
            retry_max = 3;
            retry_interval = "15s";
        };
    };
}