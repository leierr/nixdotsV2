{ config, lib, pkgs, ... }:
{
  home.packages = [ pkgs.alacritty ];
  home.file."${config.home.homeDirectory}/.config/alacritty/alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink (./alacritty.yml);
}