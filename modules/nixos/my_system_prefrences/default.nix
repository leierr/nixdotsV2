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
}