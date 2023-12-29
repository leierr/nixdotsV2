{
  description = "Desktop Config";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-23.11";
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "electron-25.9.0" ];
      };
    };
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
        specialArgs = inputs;
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      workmachine = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/workmachine/configuration.nix
        ];
      };

      testing_vm = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/testing_vm/configuration.nix
        ];
      };

    };
  };
}
