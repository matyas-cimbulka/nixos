{
    programs.git = {
        enable = true;
        userName = "Matyas Cimbulka";
        userEmail = "matyas.cimbulka@gmail.com";

        signing = {
            key = "CC4BE8447014DA973AC7E95A770312BA4911CD17";
            signByDefault = true;
        };

        extraConfig = {
            alias = {
                aa = "add -A";
                amend = "commit -a --amend --no-edit";

                br = "branch";
                bra = "branch -a";

                cdf = "clean -df";
                ci = "commit";
                co = "checkout";
                cod = "checkout .";

                pr = "pull --rebase";

                rh = "reset HEAD";

                st = "status -bs";
                sta = "status";
            };

            init.defaultBranch = "main";
            core.editor = "code --wait";
            gitbutler.signCommits = true;
        };
    };
}