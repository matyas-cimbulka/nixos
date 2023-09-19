{ pkgs, ... }:

{
    home.packages = [ pkgs.zellij ];

    programs.zellij = {      
        enable = true;
    #    enableZshIntegration = true;

        settings = {
            theme = "nord";
            pane_frames = false;
        };
    };
}