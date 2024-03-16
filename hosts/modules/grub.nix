{ lib, config, ... }:
with lib;
let
  cfg = config.modules.grub;
in {
  options.modules.grub = {
    enable = mkEnableOption "enable grub setup";
    dualBoot = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        configurationLimit = 5;

        useOSProber = cfg.dualBoot;
        default = mkIf cfg.dualBoot "saved";
      };
    };
  };
}