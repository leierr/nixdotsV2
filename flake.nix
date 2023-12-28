{
  description = "Desktop Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {

      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      workmachine = nixpkgs.lib.nixosSystem {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "electron-25.9.0" ];
        };
        specialArgs = inputs;
        modules = [
          ./hosts/workmachine/configuration.nix
        ];
      };

      testing_vm = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/testing_vm/configuration.nix
        ];
      };

    };
  };
}
