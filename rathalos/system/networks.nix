{ ... }: {

  networking = {
    hostName = "${host}";
    networkmanager.enable = true;

    firewall.enable = true;
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # extraHosts = ''
    # '';
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
