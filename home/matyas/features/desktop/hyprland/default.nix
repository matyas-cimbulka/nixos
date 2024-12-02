{ pkgs, ... }:

{
    imports = [
        ../common

        ./config.nix
        ./dunst.nix
        ./hypridle.nix
        ./hyperlock.nix
    ];

    home.packages = with pkgs; [
        gedit
        nautilus

        playerctl
        wofi
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.variables = [ "--all" ]; # this allows for running Hyprland utils as systemd services
    };
}