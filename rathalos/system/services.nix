{ pgks, ... }: {
  # setup mouse and keyboard for xserver
  services.xserver = {
    xkb = {
      layout = "gb";
      variant = "";
    };
  };
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    mouse.accelSpeed = "1";
  };


  services.keybase.enable = true;

  # Extra packages just for this system
  virtualisation.docker.enable = true;

  # enable mullvad daemon
  services.mullvad-vpn.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
