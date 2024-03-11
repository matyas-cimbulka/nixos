{ pkgs, inputs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager
        ./hardware-configuration.nix
        ./boot.nix
        ./profiles

        ../modules
        ../profiles/users/admin.nix
        ../profiles/certs/cimbulka-net.nix
    ];

    modules = {
        acme.enable = true;
        autoUpgrade.enable = true;
        nix.enable = true;

        networking = {
            enable = true;
            hostName = "titan";
        };
    };

    time.timeZone = "Europe/Prague";

    networking = {
        hosts = {
            "192.168.50.2" = [ "nas-1" ];
            "192.168.50.6" = [ "europa" ];
        };

        firewall.allowedTCPPorts = [ 2049 ];

        vlans = {
            vlan10 = { id = 10; interface = "end0"; };
        };

        interfaces.vlan10.ipv4.addresses = [{
            address = "10.0.10.2";
            prefixLength = 24;
        }];
    };

    services = {
        rpcbind.enable = true;

        nfs.server = {
            enable = true;
            
            exports = ''
                /export 192.168.50.6(rw,fsid=0,no_subtree_check)
                /export/hdd/volumes 192.168.50.6(rw,sync,no_subtree_check,nohide,insecure)
                /export/ssd/volumes 192.168.50.6(rw,sync,no_subtree_check,nohide,insecure)
                /export/ssd/config 192.168.50.6(rw,sync,no_subtree_check,nohide,insecure)
            '';
        };
    };
    
    environment.systemPackages = with pkgs; [ nfs-utils ];

    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.users.admin = import ../../home/admin/titan.nix;

    system.stateVersion = "24.05";
}