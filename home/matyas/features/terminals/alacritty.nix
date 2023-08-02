{ default, config, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            window = {
                decorations = "none";
                dynamic_padding = true;
                padding = {
                    x = 5;
                    y = 5;
                };
                startup_mode = "Maximized";
            };

            font = {
                normal = {
                    family = "FiraCode Nerd Font";
                    style = "Regular";
                };

                bold = {
                    family = "FiraCode Nerd Font";
                    style = "Bold";
                };

                italic = {
                    family = "FiraCode Nerd Font";
                    style = "Italic";
                };
            };
        };
    };
}