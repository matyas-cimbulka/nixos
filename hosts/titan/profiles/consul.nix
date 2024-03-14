{
    imports = [
        ../../modules/consul.nix
    ];

    networking.firewall.allowedTCPPorts = [
        8300
        8301
        8302
    ];

    modules.consul = {
        enable = true;
        nodeName = "titan";
        openFirewall = true;
        ui = true;
    };

    services.consul.extraConfig = {
        server = true;
        bootstrap_expect = 1;

        advertise_addr = "10.0.10.2";
    };
}