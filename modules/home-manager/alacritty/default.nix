{ config, lib, pkgs, ... }:
{
  home.packages = [ pkgs.alacritty ];
  xdg.configFile."alacritty/alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink (./alacritty.yml);
}