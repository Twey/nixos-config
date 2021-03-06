# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./filesystems.nix
      ./display.nix
      ./fonts.nix
      ./software.nix
      ./printing.nix
      ./nix.nix
    ];

  # services.xserver.enable = false;

  boot.kernelPackages = pkgs.linuxPackages;

  nixpkgs.config.allowUnfree = true; # Sorry, rms

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = false;
  boot.cleanTmpDir = true;
  boot.tmpOnTmpfs = false;

  networking.hostName = "uruz"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n =
  { defaultLocale = "en_GB.UTF-8";
    inputMethod =
    { enabled = "uim"; }; };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.sshd.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #users.extraUsers.twey = {
  #  isNormalUser = true;
  #  uid = 1000;
  #  groups = [ "wheel " ];
  #};

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";
}
