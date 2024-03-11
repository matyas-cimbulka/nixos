{ pkgs, ... }:

{
    home.packages = with pkgs; [
        consul
    ];

    home.sessionVariables = {
        CONSUL_HTTP_ADDR = "https://consul.cimbulka.net";
    };
}