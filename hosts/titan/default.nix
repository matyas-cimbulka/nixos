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

        hosts = {
            "192.168.50.2" = [ "nas-1" ];
            "192.168.50.6" = [ "europa" ];
        };
    };

    services = {
        xserver = {
            # enable = false;
            xkb.layout = "us";
        };

        nfs.server = {
            enable = true;
            
            exports = ''
                /mnt/hdd/ 192.168.50.6(rw,sync,no_root_squash,no_subtree_check,nohide)
            '';
        };
    };

    system.stateVersion = "24.05";
}