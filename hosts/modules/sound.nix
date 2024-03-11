{ lib, config, ... }:
with lib;
let
  cfg = config.modules.sound;
in {
  options.modules.sound = {
    enable = mkEnableOption "enable sound config";
    jack = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;

    sound.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = cfg.jack;
      
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}