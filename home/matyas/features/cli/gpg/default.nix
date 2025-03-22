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

        defaultCacheTtl = 1800; # Cache for 30 minutes
        maxCacheTtl = 7200;     # Maximum cache for 2 hours

        pinentryPackage = pkgs.pinentry-gnome3;

        sshKeys = [
            "88B23F522363F9A60380D4D9378E07A865B174ED"
            "BD4058794602759DB44A3EF22BEBF52C0C8B2AE3"
        ];
    };
}
