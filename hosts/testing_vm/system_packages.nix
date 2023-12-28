{ pkgs, inputs, ... }:
{
  # mlocate
  services.locate = {
    enable = true;
    localuser = null; # silence warning
    package = pkgs.mlocate;
    interval = "hourly";
  };

  # editor
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # GPG
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    enableSSHSupport = false;
  };

  environment.systemPackages = with pkgs; [bash-completion dig neofetch git] ++ (with inputs.pkgs_unstable; [
    opentofu
  ]);
}