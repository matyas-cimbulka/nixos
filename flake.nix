{
  description = "NixOs configuration";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { nixpkgs, home-manager, ... }@inputs: {
    # NixOs configuration endpoint
    # Command: nixos-rebuild --flake .#hostname
    nixosConfigurations = {
      deimos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/deimos
        ];
      };
      mars = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/mars
        ];
      };
    };
    
    # Entry point for home-manager configuration
    # Command: home-manager --flake .#username
    homeConfigurations = {
      "matyas@deimos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/matyas/deimos ];
      };
      "matyas@mars" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/matyas/mars ];
      };
    };
  };
}
