{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.hyprland;
in {
  options.modules.hyprland = {
    enable = mkEnableOption "enable Hyprland WM";
  };

  config = mkIf cfg.enable {
    programs. = {
        hyprland.enable = true;
        xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        nushell
    ];

    i18n.supportedLocales = [ "all" ];

  };
}