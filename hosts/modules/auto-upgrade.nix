{ lib, config, inputs, ... }:
with lib;
let
  inherit (config.networking) hostName;
  cfg = config.utils.autoUpgrade;
  isClean = inputs.self ? rev;
in {
  options.utils.autoUpgrade = {
    enable = mkEnableOption "enable auto upgrade setup";
  };

  config = mkIf cfg.enable {
    system.autoUpgrade = {
      enable = isClean;
      flake = "gitlab:matyas.cimbulka/nixos-configuration";
      dates = "daily";
    };
  };
}