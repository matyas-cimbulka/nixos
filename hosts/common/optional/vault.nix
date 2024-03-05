{
    networking.firewall.allowedTCPPorts = [
        8200
        8201
    ];

    services.vault = {
        enable = true;

        storageBackend = "raft";
        storagePath = "/opt/vault";
    };
}