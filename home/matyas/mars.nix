{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/gnome

        ./features/terminals/kitty.nix
        ./features/terminals/ghostty.nix

        ./features/office
        # ./features/proton
        ./features/vscode
        ./features/webdev
    ];
}