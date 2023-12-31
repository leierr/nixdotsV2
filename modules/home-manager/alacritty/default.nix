{ lib, pkgs, ... }:
{
  home.packages = [ pkgs.alacritty ];
  home.file.".config/alacritty/alacritty.yml".source = lib.file.mkOutOfStoreSymlink ./alacritty.yml;
}