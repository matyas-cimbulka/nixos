{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/gnome
    ];

    colorscheme = inputs.nix-colors.colorschemes.material;
}