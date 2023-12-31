{ config, pkgs, ... }:
{
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/e92177a4-df27-4271-a0ee-d1bee8afe8a0";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/5264-D0E6";
      fsType = "vfat";
    };

  swapDevices = [ ];

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";

  boot.initrd.kernelModules = [ ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };

  services.xserver.xrandrHeads = [
    {
      output = "DisplayPort-0";
      primary = true;
      monitorConfig = ''
        Option "Position" "2560 0"
        Option "Enable" "true"
        Option "Rotate" "normal"
        Option "PreferredMode" "2560x1440_144"
      '';
    }
    {
      output = "DisplayPort-1";
      monitorConfig = ''
        Option "Position" "0 0"
        Option "Enable" "true"
        Option "Rotate" "normal"
        Option "PreferredMode" "2560x1440_144"
      '';
    }
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.libinput.enable = true;
}
