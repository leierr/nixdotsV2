{ pkgs, ... }:
{
  # mlocate
  services.locate = {
    enable = true;
    localuser = null; # silence warning
    package = pkgs.mlocate;
    interval = "hourly";
  };

  
}