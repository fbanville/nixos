#{ config, pkgs, home-manager, sops-nix, ... }:
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
        identityFile = "/home/fba/.ssh/id_ed25519_github";
      };
      "ovh" = {
        hostname = "142.4.210.88";
        identityFile = "/home/fba/.ssh/id_ed25519";
      };
      "home" = {
        hostname = "192.168.2.16";
        identityFile = "/home/fba/.ssh/id_ed25519";
      };
    }; 
  };
  #WORKS home.file."toto".source = ./toto;
  #WORKS home.file."toto".text = "now this is titi";
  #FAILS home.file."toto".text = config.sops.secrets.fba_password.path;
}
