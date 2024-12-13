{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/common
        ./features/kitty

        ./features/office
        # ./features/proton
        ./features/vscode
        ./features/webdev
    ];
}