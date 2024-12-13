{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/gnome
        ./features/kitty

        ./features/office
        ./features/vscode
        ./features/webdev
    ];
}
