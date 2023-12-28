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

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {allowUnfree = true;};
    };
  in
  {
    nixosConfigurations = {
      extraSpecialArgs = { inherit inputs; inherit pkgs-unstable; };

      desktop = pkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      laptop = pkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      workmachine = pkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/workmachine/configuration.nix
        ];
      };

      testing_vm = pkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/testing_vm/configuration.nix
        ];
      };

    };
  };
}
