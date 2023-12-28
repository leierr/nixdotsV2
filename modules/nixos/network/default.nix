{
  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd"; # stable = wpa_supplicant
        powersave = false;
      };
      dhcp = "internal";
      logLevel = "WARN";
      extraConfig = ''
        [main]
        no-auto-default=*
      '';
    };
    useNetworkd = false; # om jeg ikke hadde hatt vpn setup hadde jeg brukt den
    enableIPv6 = false; # all my homies use ipv4
    dhcpcd.enable = false;
    useDHCP = false;
    firewall = {
      enable = true;
      # allowedTCPPorts = [ 80 443 ];
    };
    nftables = {
      enable = true;
      ruleset = "";
    };
  };

  #environment.etc."NetworkManager/system-connections/enp6s0.nmconnection" = {
  #  text = ''
  #    [connection]
  #    id=enp6s0
  #    type=ethernet
  #    interface-name=enp6s0
  #    autoconnect=true
  #
  #    [ipv4]
  #    method=auto
  #
  #    [ipv6]
  #    method=disabled
  #  '';
  #  uid = 0;
  #  gid = 0;
  #  mode = "0600";
  #};
}