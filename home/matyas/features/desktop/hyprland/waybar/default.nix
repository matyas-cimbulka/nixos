{
    programs.waybar = {
        enable = true;
        style = ./styles.css;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";

                modules-left = [ "hyprland/workspaces" "wlr/taskbar" ];
                modules-center = [ "hyprland/window" ];
                modules-right = [ "tray" "network" "wireplumber" "backlight" "battery" "hyprland/language" "user" ];

                "wlr/workspaces" = {
                    format = "{name}";
                };

                "hyprland/window" = {
                    max-length = 200;
                    separate-outputs = true;
                };

                "language" = {
                    format = "{short}";
                };

                "user" = {
                    format = "{user}";
                };
            };
        };
    };
}