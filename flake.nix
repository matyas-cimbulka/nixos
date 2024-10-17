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
      titan = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/titan
        ];
      };
      europa = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/europa
        ];
      };
    };
    
    # Entry point for home-manager configuration
    # Command: home-manager --flake .#username
    homeConfigurations = {
      "matyas@deimos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/matyas/deimos.nix ];
      };
      "matyas@mars" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/matyas/mars.nix ];
      };
      "admin@titan" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/admin/titan.nix ];
      };
      "admin@europa" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/admin/europa.nix ];
      };
    };
  };
}
