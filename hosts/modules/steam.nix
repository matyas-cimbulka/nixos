{ lib, config, ... }:
with lib;
let
    cfg = config.modules.steam;
in {
    options.modules.steam = {
        enable = mkEnableOption "Enable Steam";
    };

    config = mkIf cfg.enable {
        programs.steam.enable = true;
    };
}