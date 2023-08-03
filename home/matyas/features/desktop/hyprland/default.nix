{ inputs, lib, config, pkgs, ... }:

{
    imports = [
        ../common
        ../common/wayland-wm

        ./waybar
        ../../terminals/alacritty.nix
    ];

    home.packages = with pkgs; [
    #    inputs.hyprland-contrib.grimblast
    #    hyperslurp
        wofi

        xfce.thunar
        xfce.thunar-volman
        xfce.thunar-archive-plugin
        xfce.thunar-media-tags-plugin
    ];

    wayland.windowManager.hyprland = {
        enable = true;

        xwayland.enable = true;
        systemdIntegration = true;
        enableNvidiaPatches = true;

        settings = {
            exec-once = [
                "waybar"
            ];
            
            input = {
                follow_mouse = 1;
            };

            general = {
                gaps_in = 5;
                gaps_out = 5;
            };

            decoration = {
                rounding = 10;
                blur = true;
                blur_size = 3;
                blur_passes = 1;
                blur_new_optimizations = true;

                drop_shadow = true;
                shadow_range = 4;
                shadow_render_power = 3;
                "col.shadow" = "rgba(1a1a1aee)";
            };

            animations = {
                enabled = true;

                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default"
                ];
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_is_master = true;
            };

            gestures = {
                workspace_swipe = true;
            };

            "$mod" = "SUPER";

            bind = [
                "$mod, T, exec, alacritty"
                "$mod, C, killactive"
                "$mod, M, exit"
                "$mod, E, exec, thunar"
                "$mod, V, togglefloating"
                "$mod, R, exec, wofi --show drun"
                "$mod, P, pseudo" # dwindle
                "$mod, J, togglesplit" # dwindle

                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                "$mod, 0, workspace, 10"

                "$mod SHIFT, 1, movetoworkspace, 1"
                "$mod SHIFT, 2, movetoworkspace, 2"
                "$mod SHIFT, 3, movetoworkspace, 3"
                "$mod SHIFT, 4, movetoworkspace, 4"
                "$mod SHIFT, 5, movetoworkspace, 5"
                "$mod SHIFT, 6, movetoworkspace, 6"
                "$mod SHIFT, 7, movetoworkspace, 7"
                "$mod SHIFT, 8, movetoworkspace, 8"
                "$mod SHIFT, 9, movetoworkspace, 9"
                "$mod SHIFT, 0, movetoworkspace, 10"

                # Scroll through workspacesee
                "CONTROL ALT, left, workspace, r-1"
                "CONTROL ALT, right, workspace, r+1"
                "CONTROL ALT SHIFT, left, movetoworkspace, r-1"
                "CONTROL ALT SHIFT, right, movetoworkspace, r+1"
            ];

            bindm = [
                # Move resize windows with mod + LMB/RMB and dragging
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];
        };
    };
}