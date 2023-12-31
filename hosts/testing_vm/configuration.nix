{ config, pkgs, lib, home-manager, my_awesomewm_config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system_packages.nix
    home-manager.nixosModules.default
    ../../modules/nixos/main_user
    ../../modules/nixos/sudoers
    ../../modules/nixos/fonts
    ../../modules/nixos/locale-timedate
    ../../modules/nixos/network
    ../../modules/nixos/pinentry
    ../../modules/nixos/sound
    ../../modules/nixos/common_settings
    ../../modules/nixos/virtualization
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.${config.main_user_module.name} = {
      inherit my_awesomewm_config;
      home.stateVersion = "${config.system.stateVersion}";
      imports = [
        ../../modules/home-manager/alacritty
      ];
    };
  };

  # primary user settings
  main_user_module.secondaryGroups = [ "wheel" "docker" "networkmanager" "libvirtd" ];

  # sudo module settings
  sudo_module.wheelNeedsPassword = false;

  # nixos version
  system.stateVersion = "23.11";
}