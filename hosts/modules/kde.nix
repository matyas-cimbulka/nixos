{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.kde;
in {
  options.modules.kde = {
    enable = mkEnableOption "enable KDE DE";
  };

  config = mkIf cfg.enable {
    programs.xwayland.enable = true;

    i18n.supportedLocales = [ "all" ];

    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = false;
      };

      dbus.packages = with pkgs; [ gcr ];
    };
  };
}