{
    networking.firewall.allowedTCPPorts = [
        4646
        4647
        4648
    ];

    environment = {
        etc."nomad".source = ../common/nomad;

        systemPackages = with pkgs; [ cni-plugins ];
    };

    services.nomad = {
        enable = true;

        enableDocker = true;
        dropPrivileges = false;

        extraPackages = with pkgs; [ consul ];
        extraSettingsPaths = [ "/etc/nomad" ];

        settings = {
            datacenter = "homelab";
            data_dir = "/opt/nomad";

            bind_addr = "0.0.0.0";

            client = {
                enabled = true;
                server_join = {
                    retry_join = [ "10.0.10.2:4647" ];
                    retry_max = 3;
                    retry_interval = "15s";
                };
                cni_path = "${pkgs.cni-plugins}/bin";
            };
        };
    };
}