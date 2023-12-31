# home-manager configuration for user fba
#

{ config, pkgs, home-manager, ... }:
{
  home.stateVersion = "23.05";
  home.username = "fba";
  home.homeDirectory = "/home/fba";
  programs.bash = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      config = "git --git-dir=/home/fba/.cfg/ --work-tree=/home/fba";
    };
  };
  programs.oh-my-posh = {
    enable = true;
  };
  home.packages = [
  ];
  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.git = {
    enable = true;
    userName = "François Banville";
    userEmail = "waf@banber.org";
  };
  programs.direnv.enable = true;
  nixpkgs.config.allowUnfreePredicate = _: true;
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      #vscodevim.vim
      yzhang.markdown-all-in-one
      mgt19937.typst-preview
      kamadorueda.alejandra
      rust-lang.rust-analyzer
    ];
  };
}
