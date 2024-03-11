{
    imports = [
        ../common/optional/consul.nix
    ];

    networking.firewall.allowedTCPPorts = [
        8300
        8302
    ];

    services.consul = {
        webUi = true;

        extraConfig = {
            node_name = "titan";
            server = true;
            bootstrap_expect = 1;

            advertise_addr = "10.0.10.2";
        };
    };
}
