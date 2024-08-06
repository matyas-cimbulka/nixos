{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/common
        ./features/office
        ./features/proton
        ./features/vscode
        ./features/webdev
    ];
}