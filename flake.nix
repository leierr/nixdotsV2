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
        specialArgs = { inherit inputs; inherit system; };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit system; };
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      workmachine = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit system; };
        modules = [
          ./hosts/workmachine/configuration.nix
        ];
      };

      testing_vm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit system; };
        modules = [
          ./hosts/testing_vm/configuration.nix
        ];
      };

    };
  };
}
