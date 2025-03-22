{ pkgs, ... }:

{
    home.packages = with pkgs; [ jujutsu ];

    home.file."config.toml" = {
        target = ".config/jj/config.toml";
        text = ''
        [user]
        name = "Matyas Cimbulka"
        email = "matyas.cimbulka@gmail.com"

        [signing]
        behavior = "own"
        backend = "gpg"
        key = "matyas.cimbulka@gmail.com"

        [git]
        sign-on-push = true
        '';
    };

    programs.git = {
        enable = true;
        userName = "Matyas Cimbulka";
        userEmail = "matyas.cimbulka@gmail.com";

        signing = {
            signByDefault = true;
            key = null;
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