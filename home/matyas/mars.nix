{ inputs, ... }:

{
    imports = [
        ./global

        ./features/desktop/common
        ./features/gitkraken
        ./features/office
        ./features/proton
        ./features/vscode
        ./features/webdev
    ];
}