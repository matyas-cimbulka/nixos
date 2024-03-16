{
    security.acme.certs."cimbulka.net" = {
        dnsProvider = "cloudflare";
        environmentFile = "/mnt/ssd/config/cloudflare/credentials-nix";

        extraDomainNames = [
            "*.cimbulka.net"
        ];
    };
}