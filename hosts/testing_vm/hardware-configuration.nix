{ config, pkgs, ... }:
{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8d506461-6ed7-4756-981b-19b51608a762";
    fsType = "ext4";
  };

  swapDevices = [ ];

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [];

  boot.initrd.kernelModules = [ "virtio_balloon" "virtio_console" "virtio_rng" ];
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" "virtio_net" "virtio_mmio" "virtio_scsi" "9p" "9pnet_virtio" ];
}
