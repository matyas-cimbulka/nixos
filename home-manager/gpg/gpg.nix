{
    programs.gpg = {
        enable = true;

        publicKeys = [
            {
                source = ./pub-key.asc;
                trust = "ultimate";
            }
        ];
    };
}