{ lib, config, ... }:
let
  cfg = config.sudo_module;
  mkOption = lib.mkOption;
  types = lib.types;
in
{
  options.sudo_module = {
    wheelNeedsPassword = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = {
    security.doas.enable = false;
    security.sudo.enable = true;
    security.sudo.wheelNeedsPassword = cfg.wheelNeedsPassword;
  };
}