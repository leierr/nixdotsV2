{ lib, config, pkgs, ... }:
let
  cfg = config.desktop_module;
  mkOption = lib.mkOption;
  types = lib.types;
  mkIf = lib.mkIf;
in
{
  options.desktop_module = {
    bspwm = mkOption {
      type = types.bool;
      default = false;
    };

    awesomewm = mkOption {
      type = types.bool;
      default = false;
    };

    defaultSession = mkOption {
      type = types.singleLineStr;
      default = null;
    };

    displayManager = mkOption {
      type = types.singleLineStr;
      default = "";
    };

  };

  config = {
    services.xserver = {
      enable = true;

      windowManager = {
        bspwm = mkIf cfg.bspwm { enable = true; package = pkgs.bspwm; };
        awesome = mkIf cfg.awesomewm { enable = true; package = pkgs.unstable.awesome; };
      };

      displayManager = {
        defaultSession = mkIf (cfg.defaultSession != null) cfg.defaultSession; # "none+bspwm"
        gdm = mkIf (cfg.displayManager == "gdm") {
          enable = true;
          autoSuspend = false;
        };
      };
    };
  };
}