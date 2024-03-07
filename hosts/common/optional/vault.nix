{
    networking.firewall.allowedTCPPorts = [
        8200
        8201
    ];

    services.vault = {
        enable = true;

        storageBackend = "raft";
        storagePath = "/opt/vault";

        address = "0.0.0.0:8200";

        storageConfig = ''
            node_id = "titan"
        '';

        extraConfig = ''
            ui = true
        '';
    };
}