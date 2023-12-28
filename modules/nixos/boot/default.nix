{
  boot.loader.grub.enable = false;
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
      systemd.enable = false;
    };

    tmp.cleanOnBoot = true;
    extraModulePackages = [ ];
  };
}
