{ lib, config, ... }:
with lib;
let
  cfg = config.services.smartcards;
in {
  options.services.smartcards = {
    enable = mkEnableOption "enable smartcards service";
  };

  config = mkIf cfg.enable {
    hardware.gpgSmartcards.enable = true;
    services.pcscd.enable = true;
  };
}