{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/gnome
        ./features/office
        ./features/vscode
    ];
}
