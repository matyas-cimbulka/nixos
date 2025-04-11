{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
    users = {
        users.admin = {
            isNormalUser = true;
            description = "Administrator";
            shell = pkgs.zsh;
            extraGroups = [
                "wheel"
            ] ++ ifTheyExist [
                "network"
                "networkmanager"
                "docker"
                "podman"
                "git"
                "libvirtd"
            ];

            packages = [ pkgs.home-manager ];

            openssh.authorizedKeys.keys = [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDj9FYInpBwdwDZguywz/rUR+RUikiRtxwVvfA/9qcQffevXVKHWuRxgXBX7oGweirJ1Ou4+AfkkJB+J0yMtcRkVsR8s8JPbtGx96FPi5qZVyw5hgyFoyoPl9ERdz+H58xk051Y8GJeFFbCLRhsLKbNv1kTqgwTY51tZq5Kj+gSTpadndzKfXgpFKyfX1zHDkO9F2pQjhmHFCtrTjEebq9XTkfzFb5DOt7C/CZbV1qqpIybu6D16PMi+NPamE3iYu3wSzwhAf+oBaZ526Ae0CA9bpCKjEelkpiREZjX6Axf3JquRAer5Dt412SY7qICK9WtjXJDc62e1Yw+bnoeiPmQj9OlF5XQ/jyl0yXpAfefKi/clCQHg6EuLgH5GOE+FcuFnMjeII2y80UR35zuPCOuAnxrNbhUFM2yDoGQuaiWylRjVgQ8lBr5ZJSErh02QZ6e9w7NTe3JN24zHLze0TW/lCcEdADr7O6xBfTlrDXQLbf0+B9FaI3Y2S/jhiOI/y8hQMV0KFuPWigm4H1C+iUIyKEOTczh/KJrdJXAxn7+1sSDrJyH2TF3YHNROWDstkMfFeqwbyedbvBqC0w7SOaYB/QWd3U2hF8EAAfhtkJHqAzyRxli4sbaolMN2S0FhyF/z+nqO6+09KGABYIyYaDEQnn0GyqX7dNULBci4Pw3Mw=="
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDa9rF4MsfUlXxolkXp9z65QmIXqJjNY4jijDC9PXEd0IRETH1bXJewFrf14EqlRaW+dYr+vHX6MvVyCBgLV4VyBhxFIS2TWJg232ijEQNTkR8dQqo6JsN90SJ4uiKKNSLhWG9wWFTGOacRZheqXjyknHDD2BeU3FEfLpVK2/fZoVMvruG7KnWlXgc0wXnEXNmG3+4+Bfat3XznytgQf/iIFMYNngAGn1OV9cduJplzuAqVc4/HsyFxvUmIo41OLpA+N6XpghrUp8MrFEGTDE9WWNKE65oLRGWHZ4z3Osyisd+SNsR7wPSiIyTJWqbWidwmYLxAv+5nq+E3HjKqLu0E4/OWiGqDLMIKH2j3ZD4aj7xHcEMsSua46a88wOgYjmXJE8vUQ5KvzuFWZ1HsRBcRK9ayWdyUyPsgs6VIYYixhBxsMB9MYsR7vIA8YdLTRqLTK6xrSzNv6yrro5u/pGaAyIB0STmtKBiGmRoxbvcCaRW8xEqP3CT9wq4JvSF9F1JmACIC/PLWfJMN69YAjI7J672+tVwXtlHGOJjEzV5K7a8v1kfMSxsS7lHBiNAw7lkLK5vflDJc2BARZzAz0jHriZGGzWw9RtjWFaJjlMci2vcm2quXzTEUFCFC3SVVuapzmB/+Y4XHHvqo5FtYMNaiRuSkQI9eTpqmEmqiEVUwoQ=="
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqj06q4ST/wykMdCvrqq4x6S7aLIdfWy/plW7aoWxrJ"
            ];
        };
    };

    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ];
}