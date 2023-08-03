{
    programs.waybar = {
        enable = true;
        style = ./styles.css;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 32;

                modules-left = [ "hyprland/workspaces" "hyprland/window" ];
                modules-center = [ "clock" ];
                modules-right = [ "tray" "hyprland/language" "battery" "backlight" "wireplumber" "network" ];

                "wlr/workspaces" = {
                    format = "{name}";
                    disable-scroll = true;
                    disable-markup = false;
                    all-outputs = true;
                };

                "hyprland/window" = {
                    max-length = 200;
                    separate-outputs = true;
                };

                clock = {
                    format-alt = "{:%a, %d. %b  %H:%M}";
                };

                tray = {
                    icons-size = 18;
                    spacing = 10;
                };

                battery = {
                    format = "{capacity}% {icon}";
                    format-charging = "{capacity}% ";
                    format-plugged = "{capacity}% ";
                    format-icons = [ "" "" "" "" "" ];
                    states = {
                        warning = 30;
                        critical = 15;
                    };
                };

                "hyprland/language" = {
                    format = "{short}";
                };

                backlight = {
                    format = "{icon} {percent}%";
                    format-icons = [ "" ];
                };

                wireplumber = {
                    format = "{icon} {volume}%";
                };

                network = {
                    format-wifi = "{icon} ";
                    format-ethernet = "{icon} ";
                    format-disconnected = " Disconnected";
                    tooltip-format = "{ifname}: {ipaddr}";
                    max-lenght = 50;
                    on-click = "alacritty -e 'nmtui'";
                    format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
                };
            };
        };
    };
}