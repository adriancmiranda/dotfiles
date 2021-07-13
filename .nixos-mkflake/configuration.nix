# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let unstableTarball = fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  # Allow proprietary packages and make unstable flag. 
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  networking = {
    # Define your hostname.
    hostName = "nixos"; 

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
    
    # Enables wireless support via wpa_supplicant.
    #wireless.enable = true; 
    
    # Configure network proxy if necessary
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Login Environment.
  services.xserver.displayManager.gdm.enable = true;
  
  # Enable the Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;
  
  # Enable the Window Manager.
  # @see https://nixos.wiki/wiki/I3
  # @see https://gist.github.com/LnL7/f1266f840871d471256008c70c463fbc
  #services.xserver.windowManager.i3.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Use GPU.
  services.xserver.videoDrivers = [ "amdgpu" ];
   
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
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # Typography
     nerdfonts

     # Text editors
     neovim
     micro

     # Command lines and terminal
     xorg.xkill
     jq
     gitFull
     git-lfs
     subversion
     ngrok
     unzip
     wget
     file
     htop
     tree
     tree-sitter
     zsh
     xclip
     xsel
     tmux
     screen
     cargo
     python3
     ruby
     deno
     nodejs
     gcc
     gnumake
     ripgrep
     silver-searcher
     fzf
     luajit
     neovim-remote
     nodePackages.neovim
     nodePackages.yarn
     nodePackages.http-server
     cmus
     ranger
     neofetch
     lsof
     docker
     youtube-dl
     imagemagick
     image_optim
     ffmpeg-full
     cifs-utils
     yasm
     lshw
     nmap
     speech-tools
     notify-desktop

     # Useless CLI
     cmatrix

     # Database
     postgresql
     mongodb
     sqlite

     # Server
     nginx

     # GUI programs
     google-chrome
     flameshot
     peek

     # NixOS utils
     nix-prefetch-git
     homesick
  ];

  # A set of environment variables used in the global environment.
  # These variables will be set on shell initialisation (e.g. in /etc/profile).
  # The value of each variable can be either a string or a list of strings.
  # The latter is concatenaded, interspersed with colon characters.
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    AMBOX_SECRET = "$HOME/.ambox-secret.conf";
    NIXOS_HARDWARE_CONFIG = "/etc/nixos/hardware-configuration.nix";
    NIXOS_CONFIG = "/etc/nixos/configuration.nix";
    NIXPKGS_ALLOW_UNFREE = "1";
    GTK_IM_MODULE = "cedilla";
    NPM_CONFIG_PREFIX = "$HOME/.npm-modules";
  };
 
  # An attribute set that maps aliases (the top level attribute names in this
  # option) to command strings or directly to build outputs. The aliases are
  # added to all users' shells. Aliases mapped to null are ignored.
  environment.shellAliases = {
    # Overrides
    "mkdir" = "mkdir -pv";
    "grep" = "grep -n";
    "cs" = "cd;ls";
    "du" = "du -hsc";
    "rm" = "rm -iv";
    "cp" = "cp -iv";
    "mv" = "mv -iv";
    "ls" = "ls -Ghpl --color=auto";
    
    # Navigation
    ".1" = "cd ../";
    ".2" = "cd ../../";
    ".3" = "cd ../../../";
    ".4" = "cd ../../../";
    ".5" = "cd ../../../../";
    ".6" = "cd ../../../../../";
    ".7" = "cd ../../../../../../";
    ".8" = "cd ../../../../../../../";
    ".9" = "cd ../../../../../../../../";
    "..." = ".3";
    "...." = ".4";
    "....." = ".5";
    "......" = ".6";
    "......." = ".7";
    "........" = ".8";
    "........." = ".9";
    
    # Profile
    "@" = "cd $HOME/";
    "@capsule" = "cd $HOME/Capsule/";
    "@sites" = "cd $HOME/Sites/";
    "@documents" = "cd $HOME/Documents/";
    "@music" = "cd $HOME/Music/";
    "@desktop" = "cd $HOME/Desktop/";
    "@downloads" = "cd $HOME/Downloads/";
    "@templates" = "cd $HOME/templates/";
    "@videos" = "cd $HOME/Videos/";

    # Config's
    "@neovim" = "cd $HOME/.config/neovim/";
    "@nixpkgs" = "cd $HOME/.config/nixpkgs/";
    
    # Utilities
    "pbcopy" = "xclip -selection clipboard";
    "pbpaste" = "xclip -selection clipboard -o";
    "capsule" = "sudo mount.cifs //10.0.1.1/Data $HOME/Capsule -o user=adrian.miranda,sec=ntlm,vers=1.0;";
    "npmr" = "npm run";
    "npmw" = "npmr -w";
    "ssh-change" = "eval $(ssh-agent -s) && ssh-add";
    "-p ip" = "curl ifconfig.pro";
    "nix-collect-generations" = "nix-env -p /nix/var/nix/profiles/system --delete-generations old && nix-collect-garbage -d";

    # Dotfiles
    "hosts" = "sudo $EDITOR /etc/hosts";
    "profile" = "$EDITOR $HOME/.profile";
    "bash_profile" = "$EDITOR $HOME/.bash_profile";
    "zshrc"  = "$EDITOR $HOME/.zshrc";
    "bash_aliases" = "$EDITOR $HOME/.bash_aliases";
    "tmux.conf" = "$EDITOR $HOME/.tmux.conf";
    "gitconfig" = "$EDITOR $HOME/.gitconfig";
    "secret" = "$EDITOR $HOME/.ambox-secret.conf";
    "hardware-configuration.nix" = "sudo $EDITOR $NIXOS_HARDWARE_CONFIG";
    "configuration.nix" = "sudo $EDITOR $NIXOS_CONFIG";
  };

  # Set of aliases for bash shell, which overrides `environment.shellAliases`.
  programs.bash.shellAliases = {};

  # Set of aliases for zsh shell, which overrides `environment.shellAliases`.
  programs.zsh.shellAliases = {};
  
  # Set of zsh config.
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    enableGlobalCompInit = true;
    syntaxHighlighting.enable = true;
    vteIntegration = true;
  };
  
  # Set of .oh-my-zsh.
  programs.zsh.ohMyZsh = {
    enable = true;
    theme = "terminalparty";
    plugins = [
      "git"
      "gitignore"
      "vscode"
      "node"
      "docker"
      "cargo"
      "nmap"
      "python"
      "npm"
      "ag"
      "ansible"
      "bundler"
      "colored-man-pages"
      "zsh-syntax-highlighting"
      "zsh-autosuggestions"
      "zsh-navigation-tools zsh_reload"
    ];
  };


  # Set of aliases for fish shell, which overrides `environment.shellAliases`.
  #programs.fish.shellAliases = {};
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  #programs.mtr.enable = true;
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ ... ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  #networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

