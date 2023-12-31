{ lib, config, pkgs, ... }:
let
  cfg = config.main_user_module;
  mkOption = lib.mkOption;
  types = lib.types;
in
{
  options.main_user_module = {
    name = mkOption {
      type = types.singleLineStr;
      default = "leier";
    };

    shell = mkOption {
      type = types.shellPackage;
      default = pkgs.bash;
    };

    secondaryGroups = mkOption {
      type = types.listOf types.str;
      default = [];
    };

    description = mkOption {
      type = types.singleLineStr;
      default = "Lars Smith Eier";
    };
  };

  config = {
    # create user group until https://github.com/NixOS/nixpkgs/issues/198296 is implemented.
    users.extraGroups.${cfg.name}.name = cfg.name;

    users.users.${cfg.name} = {
      isNormalUser = true;
      shell = cfg.shell;
      home = "/home/${cfg.name}";
      homeMode = "0770";
      createHome = true;
      initialPassword = "1234";
      group = cfg.name;
      extraGroups = cfg.secondaryGroups;
      description = cfg.description;
      packages = [];
    };
  };
}