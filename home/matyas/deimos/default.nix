{ inputs, ... }:

{
    imports = [
        ../global

        ../features/desktop/gnome
        ../features/office

    #    ./hyprland.nix
    ];
}