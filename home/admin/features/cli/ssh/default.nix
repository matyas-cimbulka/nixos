{
    programs.ssh.enable = true;

    home.file.authorized_keys = {
        enable = true;
        source = ./authorized_keys;
        target = ".ssh/authorized_keys";
    };
}