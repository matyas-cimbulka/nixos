{ pkgs, ... }:

{
    imports = [
        ../common/optional/nomad
    ];

    services.nomad = {
        settings = {
            client = {
                server_join = {
                    retry_join = [ "10.0.10.2:4647" ];
                    retry_max = 3;
                    retry_interval = "15s";
                };
            };
        };
    };
}