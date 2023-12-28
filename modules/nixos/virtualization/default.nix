{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    # onBoot/onShutdown behavior
    onBoot = "ignore";
    onShutdown = "shutdown";
    # extra shit
    extraOptions = [];
    extraConfig = "";
  };

  # docker
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  
  # virt manager + docker-compose
  environment.systemPackages = with pkgs; [ virt-manager docker-compose ];
}