{
    wayland.windowManager.hyprland.settings = {
        monitor = ", preferred, auto, auto";

        "$mod" = "SUPER";
        "$terminal" = "alacritty";
        "$fileManager" = "nautilus";
        "$menu" = "wofi --show drun";

        # Autostart
        exec-once = [
            "nm-applet &"
            "hypridle"
        ];

        # Environment variables
        env = [
            "XCURSOR_SIZE, 24"
            "HYPRCURSOR_SIZE, 24"
        ];

        # Input
        input = {
            kb_layout = "us";
            follow_mouse = 1;

            sensitivity = 0;

            touchpad = {
                natural_scroll = true;
            };
        };

        gestures = {
            workspace_swipe = true;
        };

        # Keybindings
        bind = [
            "$mod, T, exec, $terminal"
            "$mod, Q, exec, $terminal"
            "$mod, C, killactive"
            "$mod, M, exit"
            "$mod, E, exec, $fileManager"
            "$mod, V, togglefloating"
            "$mod, R, exec, $menu"
            "$mod, P, pseudo" # dwindle layout
            "$mod, J, togglesplit" #dwindle layout

            # Move focus with arrow keys
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"

            # Scroll through workspaces
            "$mod, mouse_down, workspace, e+1"
            "$mod, mouse_up, workspace, e-1"
            "$mod CTRL, right, workspace, e+1"
            "$mod CTRL, left, workspace, e-1"              
        ]
        ++ (
            builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
                "$mod, code:1${toString  i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, workspace, ${toString ws}"
            ]
            )
            9)
        );

        # Move/resize window with $mod + LMB/RMB and dragging
        bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
        ];

        # Multimedia keys
        bindel = [
            ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
            ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"

            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
        ];

        # Look and feel
        general = {
            gaps_in = 5;
            gaps_out = 20;

            border_size = 2;

            col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            col.inactive_border = "rgba(595959aa)";

            resize_on_border = false;
            allow_tearing = false;

            layout = "dwindle";
        };

        decoration = {
            rounding = 10;

            active_opacity = 1.0;
            inactive_opacity = 1.0;

            shadow = {
                enabled = true;
                range = 4;
                render_power = 3;
                color = "rgba(1a1a1aee)";
            };

            blur = {
                enabled = true;
                size = 3;
                passes = 1;
                vibrancy = 0.1696;
            };
        };

        animations = {
            enabled = true;

            bezier = [
                "easeOutQuint,0.23,1,0.32,1"
                "easeInOutCubic,0.65,0.05,0.36,1"
                "linear,0,0,1,1"
                "almostLinear,0.5,0.5,0.75,1.0"
                "quick,0.15,0,0.1,1"
            ];

            animation = [
                "global, 1, 10, default"
                "border, 1, 5.39, easeOutQuint"
                "windows, 1, 4.79, easeOutQuint"
                "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                "windowsOut, 1, 1.49, linear, popin 87%"
                "fadeIn, 1, 1.73, almostLinear"
                "fadeOut, 1, 1.46, almostLinear"
                "fade, 1, 3.03, quick"
                "layers, 1, 3.81, easeOutQuint"
                "layersIn, 1, 4, easeOutQuint, fade"
                "layersOut, 1, 1.5, linear, fade"
                "fadeLayersIn, 1, 1.79, almostLinear"
                "fadeLayersOut, 1, 1.39, almostLinear"
                "workspaces, 1, 1.94, almostLinear, fade"
                "workspacesIn, 1, 1.21, almostLinear, fade"
                "workspacesOut, 1, 1.94, almostLinear, fade"
            ];
        };

        dwindle = {
            pseudotile = true;
            preserve_split = true;
        };

        master = {
            new_status = "master";
        };

        misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = false;
        };
    };
}