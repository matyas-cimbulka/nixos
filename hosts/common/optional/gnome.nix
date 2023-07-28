{ pkgs, ... }:

{
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