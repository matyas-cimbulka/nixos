{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/gnome
        ./features/office
        ./features/proton
        ./features/vscode
    ];
}