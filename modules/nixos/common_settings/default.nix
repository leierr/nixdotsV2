{ config, nixpkgs-unstable, ... }:
{
  # daemon that allows programs to request priority without going directly to the kernel
  security.rtkit.enable = true;

  # nix config
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      #access-tokens = "";
    };
  };

  # unstable packages as an overlay
  nixpkgs.overlays = [
    (final: prev: {
      unstable = import nixpkgs-unstable {
        #system = config.nixpkgs.localSystem;
        config = config.nixpkgs.config;
      };
    })
  ];
}