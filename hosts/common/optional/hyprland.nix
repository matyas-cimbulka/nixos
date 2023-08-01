{ pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        nvidiaPatches = true;
    };

    services.xserver.displayManager.gdm = {
        enable = true;
        autoSuspend = false;
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;

        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        #    xdg-desktop-portal-hyprland
        ];
    };

    environment = {
        sessionVariables.NIXOS_OZONE_WL = "1";
    };
}