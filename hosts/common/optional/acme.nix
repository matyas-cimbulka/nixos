{ pkgs, config, ... }:

{
    security.acme = {
        acceptTerms = true;
        defaults.email = "matyas.cimbulka@gmail.com";
        
        certs."cimbulka.net" = {
            dnsProvider = "cloudflare";
            environmentFile = "/mnt/ssd/config/cloudflare/credentials-nix";
        #    group = config.services.admin.group;
            extraDomainNames = [
                "*.cimbulka.net"
                "*.titan.cimbulka.net"
                "*.europa.cimbulka.net"
            ];
        };
    };
}