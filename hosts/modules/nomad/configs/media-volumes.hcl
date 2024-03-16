client {
    host_volume "movies" {
        path = "/mnt/hdd/volumes/media/movies"
    }

    host_volume "shows" {
        path = "/mnt/hdd/volumes/media/shows"
    }

    host_volume "downloads" {
        path = "/mnt/hdd/sabnzbd"
    }

    host_volume "overseerr" {
        path = "/mnt/ssd/volumes/overseerr"
    }

    host_volume "plex-media" {
        path = "/mnt/hdd/volumes/media"
    }

    host_volume "plex-config" {
        path = "/mnt/ssd/volumes/plex"
    }

    host_volume "prowlarr" {
        path = "/mnt/ssd/volumes/prowlarr"
    }

    host_volume "radarr" {
        path = "/mnt/ssd/volumes/radarr"
    }

    host_volume "sabnzbd" {
        path = "/mnt/ssd/volumes/sabnzbd"
    }

    host_volume "sonarr" {
        path = "/mnt/ssd/volumes/sonarr"
    }
}