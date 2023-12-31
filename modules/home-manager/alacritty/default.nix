{ config, lib, pkgs, ... }:
{
  home.packages = [ pkgs.alacritty ];
  home.file."${config.home.homeDirectory}/projects/dot/config/alacritty".source = config.lib.file.mkOutOfStoreSymlink ./alacritty.yml;
}