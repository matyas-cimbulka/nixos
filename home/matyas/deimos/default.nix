{ inputs, ... }:

{
    imports = [
        ../global

        ../features/desktop/gnome
    #    ./hyprland.nix
    ];

    colorscheme = inputs.nix-colors.colorschemes.material-vivid;
}