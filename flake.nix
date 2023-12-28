{
  description = "Desktop Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs_unstable.url = "nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs_unstable = nixpkgs_unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {

      desktop = pkgs.lib.nixosSystem {
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      laptop = pkgs.lib.nixosSystem {
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      workmachine = pkgs.lib.nixosSystem {
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./hosts/workmachine/configuration.nix
        ];
      };

      testing_vm = pkgs.lib.nixosSystem {
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./hosts/testing_vm/configuration.nix
        ];
      };

    };
  };
}
