{ config, ... }:

{
    home.sessionVariables.COLORTERM = "truecolor";
    
    programs.helix = {
        enable = true;
        defaultEditor = true;

        settings = {
            theme = "github_dark";
            editor = {
                color-modes = true;
                line-number = "relative";
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