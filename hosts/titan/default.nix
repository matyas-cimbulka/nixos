{
    imports = [
        ./hardware-configuration.nix
        ./boot.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/acme.nix
        ../common/optional/docker.nix
        ../common/optional/sshd.nix
    ];

    networking = {
        hostName = "titan";
        networkmanager.enable = true;

        interfaces.end0.ipv4.route = [
            {
                address = "10.0.10.0";
                prefixLength = "24";
                via = "192.168.50.220";
            }
        ];

        nat = {
            enable = true;
            forwardPorts = [
                {
                    sourcePort = 80;
                    proto = "tcp";
                    destination = "10.0.10.10";
                }
            ];
        };

        # hosts = [
        #
        # ];
    };

    services = {
        xserver = {
            # enable = false;
            xkb.layout = "us";
        };

        # nfs.server = {
        #     enable = true;
            
        #     exports = ''
        #         /export/hdd 192.168.50.6(rw,sync,no_root_squash,no_subtree_check,nohide)
        #     '';
        # };
    };

    system.stateVersion = "24.05";
}