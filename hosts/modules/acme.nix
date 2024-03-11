{ lib, config, ... }:
with lib;
let
    cfg = config.modules.acme;
in {
    options.modules.acme = {
        enable = mkEnableOption "Enable ACME config";
    };

    config = mkIf cfg.enable {
        security.acme = {
            acceptTerms = true;
            defaults.email = "matyas.cimbulka@gmail.com";
        };
    };
}