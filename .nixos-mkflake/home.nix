{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ad";
  home.homeDirectory = "/home/ad";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
  
  # Custom packages
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # ~ Terminal
    # ~ Text editors
    # ~ GUI
    # ~ Extras
  ];
  
  # Custom packages configs
  home.file = {
  }; 
}
