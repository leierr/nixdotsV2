{ pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system_packages.nix
    ../../modules/nixos/main_user
    ../../modules/nixos/sudoers
    ../../modules/nixos/fonts
    ../../modules/nixos/locale-timedate
    ../../modules/nixos/network
    ../../modules/nixos/pinentry
    ../../modules/nixos/sound
    ../../modules/nixos/common_settings
    ../../modules/nixos/virtualization
    ../../modules/nixos/desktop
  ];

  # primary user settings
  main_user_module.secondaryGroups = [ "wheel" "docker" "networkmanager" "libvirtd" ];

  # sudo module settings
  sudo_module.wheelNeedsPassword = false;

  # desktop module settings
  #desktop_module.bspwm = true;
  #desktop_module.awesomewm = true;
  #desktop_module.defaultSession = "none+bspwm";
  #desktop_module.displayManager = "gdm";

  # nixos version
  system.stateVersion = "23.11";
}