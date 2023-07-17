{ pkgs, ... }:
{
    home.packages = [ pkgs.git ];

    programs.git = {
        enable = true;
        userName = "Matyas Cimbulka";
        userEmail = "matyas.cimbulka@gmail.com";

        signing = {
            key = "CC4BE8447014DA973AC7E95A770312BA4911CD17";
            signByDefault = true;
        };

        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "vim";
        };
    };
}