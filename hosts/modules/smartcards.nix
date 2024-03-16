{ lib, config, ... }:
with lib;
let
  cfg = config.modules.smartcards;
in {
  options.modules.smartcards = {
    enable = mkEnableOption "enable smartcards service";
  };

  config = mkIf cfg.enable {
    hardware.gpgSmartcards.enable = true;
    services.pcscd.enable = true;
  };
}