{ pkgs, ... }: 

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

    services.gpg-agent = {
        enable = true;
        enableSshSupport = true;
        enableZshIntegration = true;
        enableScDaemon = true;

        pinentryPackage = pkgs.pinentry-gnome3;

        sshKeys = [
            "10DF1D66D37019480F1474ABF73E80E3703B113E"
            "93EF47B4B4A54FE9EB3758EA32DB47EC3CBEBE18"
        ];
    };
}
