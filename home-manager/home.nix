{ config, pkgs, ... }:

{
  home = {
    username = "matyas";
    homeDirectory = "/home/matyas";
    packages = with pkgs; [
      bitwarden
      google-chrome
      vscode
      
      gnome.gedit
      gnome.gnome-tweaks
      
      gnomeExtensions.appindicator
      gnomeExtensions.search-light
      gnomeExtensions.blur-my-shell
      gnomeExtensions.just-perfection
      gnomeExtensions.dash-to-dock
    ];
    
    stateVersion = "23.05";
  };
  
  imports = [
    ./git.nix
    ./gpg/gpg.nix
    ./zsh.nix
  ];
  
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
  
  programs.home-manager.enable = true;
}
