# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
    imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "nfs" ];
    boot.initrd.kernelModules = [ "nfs" "phy-rockchip-naneng-combphy" "phy-rockchip-snps-pcie3" ];
    boot.initrd.supportedFilesystems = [ "nfs" ];
    boot.kernelModules = [ "nfs" ];
    boot.extraModulePackages =[ ];

    fileSystems."/" = 
      { device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
        fsType = "ext4";
      };

    fileSystems."/mnt/hdd/volumes" = 
      { device = "titan:/hdd/volumes";
        fsType = "nfs";
        options = [ "noauto" "x-systemd.automount" "x-systemd.idle-timeout=600" ];
      };

    fileSystems."/mnt/ssd/volumes" = 
      { device = "titan:/ssd/volumes";
        fsType = "nfs";
        options = [ "noauto" "x-systemd.automount" "x-systemd.idle-timeout=600" ];
      };

    # fileSystems."/mnt/ssd/config" = 
    #   { device = "titan:/ssd/config";
    #     fsType = "nfs";
    #     options = [ "noauto" "x-systemd.automount" "x-systemd.idle-timeout=600" ];
    #   };

    swapDevices = [ ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}