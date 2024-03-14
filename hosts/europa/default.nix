{ pkgs, inputs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager
        ./hardware-configuration.nix
        ./profiles

        ../modules
        ../profiles/users/admin.nix
    ];

    modules = {
        autoUpgrade.enable = true;
        nix.enable = true;
        
        networking = {
            enable = true;
            hostName = "europa";
        };
    };

    boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        kernelParams = ["console=ttyS2,1500000"];

        loader = {
            grub.enable = false;
            generic-extlinux-compatible.enable = true;
        };
    };

    hardware.deviceTree.name = "rockchip/rk3568-odroid-m1.dtb";
    time.timeZone = "Europe/Prague";

    networking = {
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

    services.openssh = {
        enable = true;

        settings = {
            PermitRootLogin = "yes";
        };
    };

    environment.systemPackages = with pkgs; [ nfs-utils ];

    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.users.admin = import ../../home/admin/europa.nix;

    system.stateVersion = "24.05";
}