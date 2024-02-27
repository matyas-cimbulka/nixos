{ pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./nomad.nix
        ./consul.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/docker.nix
        ../common/optional/sshd.nix
    ];

    boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        kernelParams = ["console=ttyS2,1500000"];

        loader = {
            grub.enable = false;
            generic-extlinux-compatible.enable = true;
        };
    };

    hardware.deviceTree.name = "rockchip/rk3568-odroid-m1.dtb";

    networking = {
        hostName = "europa";
        networkmanager.enable = true;

        hosts = {
            "192.168.50.2" = [ "nas-1" ];
            "192.168.50.5" = [ "titan" ];
        };

        vlans = {
            vlan10 = { id = 10; interface = "end0"; };
        };

        interfaces.vlan10.ipv4.addresses = [{
            address = "10.0.10.3";
            prefixLength = 24;
        }];
    };

    environment.systemPackages = with pkgs; [ nfs-utils ];

    services.xserver = {
        enable = true;
        xkb.layout = "us";
    };

    system.stateVersion = "24.05";
}