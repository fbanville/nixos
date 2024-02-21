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
      # vi = "nvim";
      # vi = "hx";
      ls = "eza";
      lsd = "eza --long --header --git --only-dirs";
      lss = "eza --long --header --git --sort size";
      lsn = "eza --long --header --git --sort name";
      lsm = "eza --long --header --git --sort mod";
      lse = "eza --long --header --git --sort ext";
      # z  = "zoxide";
      cat = "bat";
      top = "btm";
      ps = "procs";
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
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface" = {
       color-scheme = "prefer-dark";
       cursor-size = 32;
       text-scaling-factor = 1.25;
       show-battery-percentage = true;
    };
    settings."org/gnome/Console" = {
      #last-window-size = "(652, 480)";
      audible-bell = false;
      custom-font = "Fira Code 18";
      use-system-font = false; 
    };
    settings."org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      #speed = -0.21400778210116733;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
    settings."org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };
    settings."org/gnome/desktop/session" = {
      idle-delay = 900;
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
  programs.atuin = {
    enable = true;
    settings = {
      sync_address = "https://history.banber.org";
      sync_frequency = "5m";
      # dialect = "uk";
      # key_path = config.sops.secrets.atuin_key.path;
    };
  };
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
    shlvl = {
      disabled = false;
      symbol = "ﰬ";
      style = "bright-red bold";
    };
    shell = {
      disabled = false;
      format = "$indicator";
      fish_indicator = "";
      bash_indicator = "[BASH](bright-white) ";
      zsh_indicator = "[ZSH](bright-white) ";
    };
    username = {
      style_user = "bright-white bold";
      style_root = "bright-red bold";
    };
    hostname = {
      style = "bright-green bold";
      ssh_only = true;
    };
    nix_shell = {
      symbol = "";
      format = "[$symbol$name]($style) ";
      style = "bright-purple bold";
    };
    git_branch = {
      only_attached = true;
      format = "[$symbol$branch]($style) ";
      symbol = "שׂ";
      style = "bright-yellow bold";
    };
    git_commit = {
      only_detached = true;
      format = "[ﰖ$hash]($style) ";
      style = "bright-yellow bold";
    };
    git_state = {
      style = "bright-purple bold";
    };
    git_status = {
      style = "bright-green bold";
    };
    directory = {
      read_only = " ";
      truncation_length = 0;
    };
    cmd_duration = {
      format = "[$duration]($style) ";
      style = "bright-blue";
    };
    jobs = {
      style = "bright-green bold";
    };
    character = {
      success_symbol = "[\\$](bright-green bold)";
      error_symbol = "[\\$](bright-red bold)";
    };
  };
  home.file.".face".source = ./fba.jpg;
  #WORKS home.file."toto".text = "now this is titi";
  #FAILS home.file."toto".text = config.sops.secrets.fba_password.path;
}
