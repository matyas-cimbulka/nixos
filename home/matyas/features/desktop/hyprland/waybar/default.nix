{
    programs.waybar = {
        enable = true;
        style = ./styles.css;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;

                modules-left = [ "hyprland/workspaces" "hyprland/window" ];
                modules-center = [ "clock" ];
                modules-right = [ "tray" "hyprland/language" "battery" "backlight" "network" "wireplumber" ];

                "wlr/workspaces" = {
                    format = "{name}";
                };

                "hyprland/window" = {
                    max-length = 200;
                    separate-outputs = true;
                };

                clock = {
                    format-alt = "{:%a, %d. %b  %H:%M}";
                };

                batter = {
                    format = "{capacity}% {icon}";
                    format-icons = [ "󰁻" "󰁽" "󰁿" "󰂁" "󰁹" ];
                };

                "hyprland/language" = {
                    format = "{short}";
                };

                network = {
                    format-wifi = "{essid} {icon}";
                    format-ethernet = "{ifname}";
                    format-disconnected = "";
                    max-lenght = 50;
                    on-click = "alacritty -e 'nmtui'";
                    format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
                };
            };
        };
    };
}