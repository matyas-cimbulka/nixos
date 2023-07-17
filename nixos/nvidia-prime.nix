{
    hardware = {
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
        };
        
        nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            nvidiaSettings = true;
                
            prime = {
                offload = {
                    enable = true;
                    enableOffloadCmd = true;
                };
                
                intelBusId = "PCI:0:2:0";
                nvidiaBusId = "PCI:1:0:0";
            };
        };
    };

    services.xserver.videoDrivers = [ "nvidia" ];
}