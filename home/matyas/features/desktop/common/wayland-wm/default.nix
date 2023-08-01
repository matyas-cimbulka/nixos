{ pkgs, ... }:

{
    imports = [

    ];

    home.packages = with pkgs; [
        wl-clipboard
    ];

    home.sessionVariables = {
        MOZ_ENABLE_WAYLAND = "1";
        QT_QPA_PLATFORM = "wayland";
    };
}