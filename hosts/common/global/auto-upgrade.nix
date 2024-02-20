{ config, inputs, ... }:
let
    inherit (config.networking) hostName;
    # Only enable auto upgrade if current config came from clean tree.
    isClean = inputs.self ? rev;
in
{
    system.autoUpgrade = {
        enable = isClean;
        flake = "gitlab:matyas.cimbulka/nixos-configuration";
        dates = "daily";
    };
}