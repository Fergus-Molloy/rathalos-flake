{ config, pkgs, lib, user, inputs, ... }:
let
  host = "rathalos";
in
{
  imports = [
    ./hardware-configuration.nix
    ./i18n.nix
    ./fonts.nix
    ./users.nix
    ./networks.nix
    ./packages.nix
    ./services.nix
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # set freq govenor 
  # "performance" - max speed all the time
  # "powersave" - min speed all the time
  # "ondemand" - scale speed based on load
  # "conservative" - scale speed but in increments rather than big jumps
  # "schedutil" - scale speed based on kernel scheduler
  powerManagement.cpuFreqGovernor = "schedutil";

  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    configurationLimit = 10;
  };
}
