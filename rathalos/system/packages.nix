{ config, pkgs, lib, user, inputs, ... }:
let
  nixCats = import ../../modules/nixcats { inherit inputs; };
in
{
  imports = [
    nixCats.nixosModules.default
  ];
  environment.systemPackages = with pkgs; [
    wget
    curl
    unzip
    keepassxc
    keybase # gpg identity verifier
    killall
    neovim
    rclone

    # git tools
    gh

    udisks # for mounting usb devices
    mullvad-vpn # mullvad vpn
    tmuxinator
    element-desktop
    autorandr

    qbittorrent
    chromium

    # hyprland
    hyprpolkitagent
    hyprshot
    wl-clipboard

    obsidian
    keepassxc

    monero-gui
    p2pool

    grub2

    gnupg
    pinentry-qt
    pinentry-tty
  ];

  nixCats = {
    enable = true;
    packageNames = [ "nixCats" ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Fergus Molloy";
        email = "fergus@molloy.xyz";
      };
      checkout = {
        defaultRemote = "origin";
        guess = true;
      };
      init = { defaultBranch = "main"; };
      branch = { autoSetupRebase = "always"; };
      push = { autoSetupRemote = true; };
      # create this manually on each machine, to store gpg stuff
      include = { path = "/home/${user}/.gituser"; };
    };
  };
}
