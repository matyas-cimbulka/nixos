{ pkgs, ... }:

{
    home.packages = [ pkgs.zellij ];

    programs.zellij = {      
        enable = true;
        enableZshIntegration = false;

        settings = {
            theme = "nord";
            pane_frames = false;
        };
    };
}