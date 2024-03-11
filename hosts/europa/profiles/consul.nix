{
    imports = [
        ../../modules/consul.nix
    ];

    modules.consul = {
        enable = true;
        nodeName = "europa";
        openFirewall = true;
        ui = true;
    };

    services.consul.extraConfig = {
        server = false;

        advertise_addr = "10.0.10.3";

        retry_join = [
            "10.0.10.2;8301"
        ];
    };
}