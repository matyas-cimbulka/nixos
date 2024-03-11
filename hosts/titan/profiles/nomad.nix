{
    imports = [
        ../../modules/nomad
    ];

    modules.nomad = {
        enable = true;
        openFirewall = true;
        ui = true;
    };

    services.nomad.settings = {
        advertise = {
            http = "10.0.10.2";
            rpc = "10.0.10.2:4647";
            serf = "10.0.10.2";
        };

        server = {
            enabled = true;
            bootstrap_expect = 1;
        };

        client = {
            servers = [ "10.0.10.2" ];
        };
    };
}