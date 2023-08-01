{ inputs, ... }:

{
    imports = [
        ../global

        ../features/desktop/hyprland
        ./hyprland.nix
    ];

    colorscheme = inputs.nix-colors.colorschemes.material-vivid;
}