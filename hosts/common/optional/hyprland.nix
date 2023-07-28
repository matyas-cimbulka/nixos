{ pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        nvidiaPatches = true;
    };

    services = {
        displayManager.gdm = {
            enable = true;
            autoSuspend = false;
        };
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;

        extraPortals = with pkgs [
            pkgs.xdg-desktop-portal-gtk
        ];
    };

    environment = {
        sessionVariables.NIXOS_OZONE_WL = "1";
    };
}