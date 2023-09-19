{ config, pkgs, ... }:

{
    home.sessionVariables.COLORTERM = "truecolor";

    home.packages = [ pkgs.nil ];
    
    programs.helix = {
        enable = true;
        defaultEditor = true;

        settings = {
            theme = "github_dark";
            editor = {
                color-modes = true;
                line-number = "relative";
                bufferline = "multiple";
                indent-guides.render = true;
                cursor-shape = {
                    normal = "block";
                    insert = "bar";
                    select = "underline";
                };
            };
        };
    };

    home.file.themes = {
        enable = true;
        source = ./themes;
        target = "${config.home.homeDirectory}/.config/helix/themes";
    };
}