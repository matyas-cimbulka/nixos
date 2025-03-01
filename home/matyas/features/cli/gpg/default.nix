{ pkgs, ... }: 

{
    programs.gpg = {
        enable = true;

        publicKeys = [
            {
                source = ./public-key.asc;
                trust = "ultimate";
            }
        ];
    };

    services.gpg-agent = {
        enable = true;
        enableSshSupport = true;
        enableZshIntegration = true;
        enableScDaemon = true;

        pinentryPackage = pkgs.pinentry-qt;

        sshKeys = [
            "88B23F522363F9A60380D4D9378E07A865B174ED"
            "BD4058794602759DB44A3EF22BEBF52C0C8B2AE3"
        ];
    };
}
