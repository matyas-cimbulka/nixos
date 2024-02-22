{
    imports = [
        ./hardware-configuration.nix

        ../common/global
        ../common/users/admin
        
        ../common/optional/acme.nix
        ../common/optional/docker.nix
        ../common/optional/sshd.nix
        ../common/optional/fonts.nix
    ];

    boot.loader = {
        efi.canTouchEfiVariables = false;

        grub = {
            enable = true;
            efiSupport = true;
            efiInstallAsRemovable = true;
            device = "nodev:";
            # devices = [
            #     "/dev/mmcblk1boot0"
            #     "/dev/mmcblk1boot1"
            # ];
        };
    };

    networking = {
        hostName = "titan";
        networkmanager.enable = true;

        # hosts = [
        #
        # ];
    };

    services = {
        xserver = {
            enable = false;
            xkb.layout = "us";
        };

        nfs.server = {
            enable = true;
            
            exports = ''
                /mnt/hdd/volumes 192.168.50.6(rw,sync,no_root_squash,no_subtree_check,nohide)
            '';
        };
    };

    system.stateVersion = "24.05";
}