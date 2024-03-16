client {
    host_volume "traefik" {
        path = "/mnt/ssd/volumes/traefik"
    }

    host_volume "certs" {
        path = "/var/lib/acme"
        read_only = true
    }
}