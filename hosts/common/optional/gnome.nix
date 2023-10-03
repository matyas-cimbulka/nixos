{ pkgs, ... }:

{
    programs.xwayland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    services = {
        xserver = {
            desktopManager.gnome = {
                enable = true;
            };
            displayManager.gdm = {
                enable = true;
                autoSuspend = false;
            };
        };

        udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
    };
}