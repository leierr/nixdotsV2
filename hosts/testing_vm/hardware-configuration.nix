{ config, pkgs, ... }:
{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/fa8852ad-2e34-454a-b670-9eef163d1de6";
    fsType = "ext4";
  };

  swapDevices = [ ];

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";

  boot.initrd.kernelModules = [ "virtio_balloon" "virtio_console" "virtio_rng" ];
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" "virtio_net" "virtio_mmio" "virtio_scsi" "9p" "9pnet_virtio" ];
}
