{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.gnome;
in {
  options.modules.gnome = {
    enable = mkEnableOption "enable gnome DE";
  };

  config = mkIf cfg.enable {
    programs.xwayland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    i18n.supportedLocales = [ "all" ];

    services = {
      xserver = {
        desktopManager.gnome.enable = true;
        displayManager.gdm = {
          enable = true;
          autoSuspend = false;
        };
      };

      dbus.packages = with pkgs; [ gcr ];
      udev.packages = with pkgs; [ gnome-settings-daemon ];
    };
  };
}