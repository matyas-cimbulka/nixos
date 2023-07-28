{
  #  home.packages = [ pkgs.gnupg ];

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    enableSSHSupport = true;
  };

  services.pcscd.enable = true;
}