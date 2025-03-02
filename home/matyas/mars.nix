{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/gnome
        ./features/kitty

        ./features/office
        # ./features/proton
        ./features/vscode
        ./features/webdev
    ];
}