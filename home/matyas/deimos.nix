{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/gnome
        ./features/terminals/kitty.nix
        ./features/terminals/ghostty.nix

        ./features/office
        ./features/vscode
        ./features/webdev
    ];
}
