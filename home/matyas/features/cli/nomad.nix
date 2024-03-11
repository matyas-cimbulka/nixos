{ pkgs, ... }:

{
    home.packages = with pkgs; [
        nomad
    ];

    home.sessionVariables = {
        NOMAD_ADDR = "https://nomad.cimbulka.net";
    };
}