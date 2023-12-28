{ lib, config, ... }:
let
  cfg = config.boot_module_settings;
  mkOption = lib.mkOption;
  mkIf = lib.mkIf;
  types = lib.types;
in
{
  options.boot_module_settings = {
    amdgpu = mkOption {
      type = types.bool;
      default = false;
    };
    amdcpu = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          editor = true;
        };

        efi.canTouchEfiVariables = true;
        timeout = 3;
      };

      initrd = {
        availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
        kernelModules = [ ];
        systemd.enable = false;
      };

      tmp.cleanOnBoot = true;
      extraModulePackages = [ ];
    };

    boot.kernelModules = mkIf cfg.amdgpu [ "amdgpu" ];
    boot.kernelModules = mkIf cfg.amdcpu [ "kvm-amd" ];
  };
}
