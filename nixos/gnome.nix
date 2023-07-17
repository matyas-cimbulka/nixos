{ pkgs, ... }:
{
    services = {
        xserver = {
            displayManager.gdm.enable = true;
            desktopManager.gnome.enable = true;
        };

        udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
    };
}