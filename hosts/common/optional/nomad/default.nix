{ pkgs, ... }:

{
    networking.firewall.allowedTCPPorts = [
        4646
        4647
        4648
    ];

    environment = {
        etc."nomad".source = ./configs;

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
                cni_path = "${pkgs.cni-plugins}/bin";
            };
        };
    };
}