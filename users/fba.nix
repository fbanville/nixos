#{ config, pkgs, home-manager, sops-nix, ... }:
{
  config,
  pkgs,
  home-manager,
  ...
}: {
  home.stateVersion = "23.05";
  home.username = "fba";
  home.homeDirectory = "/home/fba";
  #  sops.secrets.atuin_key = {
  #    sopsFile = ./fba-secrets.yaml;
  #  };
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
      top = "btop";
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
        identityFile = "~/.ssh/id_ed25519_github";
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        identityFile = "~/.ssh/id_ed25519_gitlab";
      };
      "ovh" = {
        hostname = "142.4.210.88";
        identityFile = "~/.ssh/id_ed25519";
      };
      "home" = {
        hostname = "192.168.2.16";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        cursor-size = 32;
        text-scaling-factor = 1.25;
        show-battery-percentage = true;
        enable-hot-corners = false;
      };
      "org/gnome/Console" = {
        audible-bell = false;
        custom-font = "Fira Code 16";
        use-system-font = false;
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        natural-scroll = false;
        #speed = -0.21400778210116733;
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };
      "org/gnome/settings-daemon/plugins/power" = {
        ambient-enabled = false;
        idle-dim = false;
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-type = "nothing";
        power-button-action = "interactive";
        power-saver-profile-on-low-battery = false;
      };
      "org/gnome/desktop/session" = {
        idle-delay = 1800;
      };
      "org/gnome/desktop/sound".event-sounds = false;
      "org/gnome/desktop/screensaver" = {
        lock-enabled = false;
      };
      "org/gnome/desktop/remote-desktop/rdp" = {
        enable = true;
        tls-cert = "/home/fba/.local/share/gnome-remote-desktop/rdp-tls.crt";
        tls-key = "/home/fba/.local/share/gnome-remote-desktop/rdp-tls.key";
        view-only = false;
      };
      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        edge-tiling = false;
      };
      "org/gnome/shell" = {
        # enabled-extensions = ['appindicatorsupport@rgcjonas.gmail.com', 'BingWallpaper@ineffable-gmail.com', 'transparent-top-bar@ftpix.com']
        favorite-apps = [
          "org.gnome.Console.desktop"
          "org.gnome.Nautilus.desktop"
          "firefox.desktop"
          "obsidian.desktop"
          "jami.desktop"
          "com.spacedrive.desktop"
          "plexamp.desktop"
        ];
      };
    };
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
      flags = [
        # "--disable-up-arrow"
        "--disable-ctrl-r"
      ];
    };
  };
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    #format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
    format = "$username$hostname$character";
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
      ssh_only = false;
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
      success_symbol = "[>](bright-green bold)";
      error_symbol = "[>](bright-red bold)";
    };
  };
  home.file.".face".source = ./fba.jpg;
  home.file.".config/onedrive/sync_list".source = ./onedrive_sync_list;
  #WORKS home.file."toto".text = "now this is titi";
  #FAILS home.file."toto".text = config.sops.secrets.fba_password.path;
}
