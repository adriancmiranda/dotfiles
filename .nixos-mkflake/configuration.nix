# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-network-host"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.useGlamor = true;

  # Enable the login canvas
  services.xserver.displayManager = {
    gdm.enable = true;
    #sddm.enable = true;
    #lightdm.enable = true;
  };

  # Enable the desktop environment(s).
  services.xserver.desktopManager = {
    gnome.enable = true;
    #xfce.enable = true;
    #lxqt.enable = true;
    #plasma5.enable = true;
    #pantheon.enable = true;
  };

  # Enable the window manager
  services.xserver.windowManager = {
    qtile.enable = true;
    xmonad.enable = true;
    xmonad.enableContribAndExtras = true;
    xmonad.extraPackages = hpkgs: [
      hpkgs.xmonad
      hpkgs.xmonad-contrib
      hpkgs.xmonad-extras
    ];
  };

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ad = {
    isNormalUser = true;
    initialPassword = " ";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # A set of environment variables used in the global environment.
  # These variables will be set on shell initialisation (e.g. in /etc/profile).
  # The value of each variable can be either a string or a list of strings.
  # The latter is concatenated, interspersed with colon characters.
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    NIXOS_CONFIG = "/etc/nixos/configuration.nix";
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  # Allow proprietary packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # ~ Terminal 
    wget
    neofetch 
    gcc
    zsh
    tmux
    ngrok
    gitFull
    git-lfs
    unzip
    file
    htop
    deno
    nodejs
    nodePackages.http-server
    xorg.xkill
    xclip
    xsel
    python3
    ruby
    cargo
    fzf
    silver-searcher
    ripgrep
    tree-sitter
    luajit
    subversion
    tree
    cmus
    cmatrix
    gnumake
    # ~ Database
    postgresql
    mongodb
    sqlite
    # ~ Text editor
    neovim
    nodePackages.neovim
    neovim-remote
    vim
    vscode
    sublime3
    micro
    # ~ GUI
    blender
    firefox
    google-chrome
    # ~ Server
    nginx
    # ~ Nix
    nix-prefetch-git
    homesick
    # ~ Window manager and related stuff
    xmobar
    #picom
    #nitrogen
    #dmenu
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

