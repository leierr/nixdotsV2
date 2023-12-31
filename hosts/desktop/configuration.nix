{ pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system_packages.nix
    ../../modules/nixos/main_user
    ../../modules/nixos/sudoers
    ../../modules/nixos/systemdboot
    ../../modules/nixos/fonts
    ../../modules/nixos/locale-timedate
    ../../modules/nixos/network
    ../../modules/nixos/pinentry
    ../../modules/nixos/sound
    ../../modules/nixos/common_settings
    ../../modules/nixos/virtualization
  ];

  # primary user settings
  main_user_module.secondaryGroups = [ "wheel" "docker" "networkmanager" "libvirtd" ];

  # sudo module settings
  sudo_module.wheelNeedsPassword = false;

  # nixos version
  system.stateVersion = "23.11";
}