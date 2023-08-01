{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/hyprland
    ];

    colorscheme = inputs.nix-colors.colorschemes.material-vivid;
}