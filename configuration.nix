{ config, pkgs, lib, ... }:
{
  #####################
  # nix global config #
  #####################

  environment.systemPackages = with pkgs;
    [
      # GNU userland
      coreutils
      gnumake
      gnugrep
      gnused

      # System config
      mkpasswd

      # Shell
      bash
      zsh
      zsh-completions
      nix-zsh-completions

      # Editor
      vim 
      
      # Dev tools
      git
      tig
      fzf
      ripgrep
      fzf
      tmux
      cmake
      ctags

      # Utilities
      tree
      findutils
      pstree
      htop
    ];


  #################################
  # NixOS config for Raspberry Pi #
  #################################

  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;
 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [ "usbhid" ];

  # Needed for the virtual console to work on the RPi 3, as the default of 16M
  # doesn't seem to be enough.  If X.org behaves weirdly (I only saw the
  # cursor) then try increasing this to 256M.  On a Raspberry Pi 4 with 4 GB,
  # you should either disable this parameter or increase to at least 64M if you
  # want the USB ports to work.
  boot.kernelParams = ["cma=32M"];
    
  # File systems configuration for using the installer's partition layout
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };


  ########################
  # Host-specific config #
  ########################

  networking.hostName = "LabPi";
  networking.wireless.enable = false;
  
  time.timeZone = "America/New_York";

  # SSH configuration
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";

  # sudo configuration
  security.sudo.configFile = ''
    %wheel ALL=(ALL) NOPASSWD: ALL
  '';


  ###################
  # User management #
  ###################

  # Fully control all user settings declaratively
  # i.e. "passwd" will be non-effective
  users.mutableUsers = false;

  users.users.root = {
    hashedPassword = "$6$ufQLBP4rG53YTioa$ZPSMcw9NZsh8u1rOqnb5X6PdVbIfK6z/eqtOHx3XAVXD9onmPFUm3YpJ6.u81pXGxjBfOeoiiahqNy9Q2UdSY1";
  };
  
  users.users.lhcb = {
    isNormalUser = true;
    home = "/home/lhcb";
    description = "UMD LHCb group user";
    extraGroups = [ "wheel" "gpio" ];
    hashedPassword = "$6$YbrmEXwgx$iIwwI9WcKKOaVP2nWhqzGqTDSQzmDfhiTUPGItT2eWM61Kjd2zgHB.6r.ATDyiHpMYpsmr3DMU1FG1yt1LILM.";
  };
}
