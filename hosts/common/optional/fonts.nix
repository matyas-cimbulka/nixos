{ pkgs, ... }: {
    fonts = {
        fontconfig.enable = true;

        packages = with pkgs; [
            nerdfonts
        ];
    };
}