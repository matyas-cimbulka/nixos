{ pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.extraSpecialArgs = { inherit inputs; };

  time.timeZone = "Europe/Prague";

  fonts = {
    fontconfig.enable = true;

    packages = with pkgs.nerd-fonts; [
      fira-mono
      fira-code
      jetbrains-mono
    ];
  };

  environment = {
    enableAllTerminfo = true;

    systemPackages = with pkgs; [
      git
      psmisc
      openssl
    ];

    variables = {
      PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WEBKIT_DISABLE_DMABUF_RENDERER = "1";
    };
  };

  services = {
    dbus.enable = true;

    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    printing.enable = true;
    flatpak.enable = true;
  };
}