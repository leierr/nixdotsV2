{ pkgs, ... }:
{
  home.packages = [ pkgs.unstable.alacritty ];
  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
}