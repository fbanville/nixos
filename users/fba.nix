{ config, pkgs, home-manager, ... }:
{
  home.stateVersion = "23.05";
  home.username = "fba";
  home.homeDirectory = "/home/fba";
  programs.bash = {
    enable = true;
    shellAliases = {
      config = "git --git-dir=/home/fba/.cfg/ --work-tree=/home/fba";
    };
  };
  home.sessionVariables = {
    EDITOR = "vi";
  };
  programs.git = {
    enable = true;
    userName = "François Banville";
    userEmail = "waf@banber.org";
  };
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "/home/fba/.ssh/id_rsa_satori";
      };
    }; 
  };
}
