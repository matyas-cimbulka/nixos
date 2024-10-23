{ lib, ... }:

{
    programs.starship = {
        enable = true;
        enableTransience = true;
        enableZshIntegration = false;

        settings = {
            add_newline = true;

            # format = "
            # $os $directory $fill $time
            # $character
            # ";

            format = lib.concatStrings [
                "$os"
                "$directory"
                "$fill"
                "$time\n"
                "$character"
            ];

            os = {
                disabled = false;
                # NixOS = " ";
            };

            fill.symbol = " ";

            time = {
                disabled = false;
            };
        };
    };
}