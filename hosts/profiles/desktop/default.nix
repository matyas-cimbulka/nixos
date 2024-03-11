{ pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.extraSpecialArgs = { inherit inputs; };

  time.timeZone = "Europe/Prague";

  fonts = {
    fontconfig.enable = true;

    packages = with pkgs; [
      nerdfonts
    ];
  };

  environment = {
    enableAllTerminfo = true;

    systemPackages = with pkgs; [
      git
      psmisc
    ];
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