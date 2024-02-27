{
    imports = [
        ./hardware-configuration.nix
        ./boot.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/acme.nix
        ../common/optional/docker.nix
        ../common/optional/sshd.nix
        ../common/optional/nomad.nix
    ];

    networking = {
        hostName = "titan";
        networkmanager.enable = true;

        hosts = {
            "192.168.50.2" = [ "nas-1" ];
            "192.168.50.6" = [ "europa" ];
        };

        firewall.allowedTCPPorts = [ 2049 ];

        vlans = {
            vlan10 = { id = 10; interface = "end0" };
        };

        interfaces.vlan10.ipv4.addresses = [{
            address = "10.0.10.2";
            prefixLength = 24;
        }];
    };

    services = {
        xserver = {
            # enable = false;
            xkb.layout = "us";
        };

        rpcbind.enable = true;

        nfs.server = {
            enable = true;
            
            exports = ''
                /export 192.168.50.0/24(rw,fsid=0,no_subtree_check)
                /export/hdd/volumes 192.168.50.0/24(rw,sync,no_subtree_check,nohide,insecure)
                /export/ssd/volumes 192.168.50.0/24(rw,sync,no_subtree_check,nohide,insecure)
                /export/ssd/config 192.168.50.0/24(rw,sync,no_subtree_check,nohide,insecure)
            '';
        };
    };

    system.stateVersion = "24.05";
}