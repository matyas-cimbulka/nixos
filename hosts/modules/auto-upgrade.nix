{ lib, config, inputs, ... }:
with lib;
let
  inherit (config.networking) hostName;
  cfg = config.modules.autoUpgrade;
  isClean = inputs.self ? rev;
in {
  options.modules.autoUpgrade = {
    enable = mkEnableOption "Enable auto upgrade setup";
  };

  config = mkIf cfg.enable {
    system.autoUpgrade = {
      enable = isClean;
      flake = "github:matyas-cimbulka/nixos";
      dates = "daily";
    };
  };
}