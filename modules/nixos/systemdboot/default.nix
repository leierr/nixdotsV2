{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = true;
      };

      grub.enable = false;

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
