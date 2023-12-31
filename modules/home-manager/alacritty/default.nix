{ lib, pkgs, ... }:
{
  home.packages = [ pkgs.alacritty ];
  home.file.".config/alacritty/alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink ./alacritty.yml;
}