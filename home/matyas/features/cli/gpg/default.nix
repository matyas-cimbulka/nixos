{ config, ... }:

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

    home.file = {
        gpg-agent = {
            enable = true;
            source = ./gpg-agent.conf;
            target = "${config.home.homeDirectory}/.gnupg/gpg-agent.conf";
        };
        sshcontrol = {
            enable = true;
            source = ./sshcontrol;
            target = "${config.home.homeDirectory}/.gnupg/sshcontrol";
        };
    };
}