{
    programs.git = {
        enable = true;
        userName = "Matyas Cimbulka";
        userEmail = "matyas.cimbulka@gmail.com";

        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "hx";
        };
    };
}