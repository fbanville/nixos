{
  config,
  pkgs,
  home-manager,
  ...
}: {
  # Latest linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest; # always use the latest kernel (bleeding edge stuff!)

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  console = {
    # too small font = "Lat2-Terminus32";
    keyMap = "us-acentos";
    #   useXkbConfig = true; # use xkbOptions in tty.
  };
  environment.systemPackages = with pkgs; [
    just
    neovim
    zellij # a screen replacement.
    git
    vim
    fastfetch
    age
    sops # secret manager for nixos config.
    btop
    unzip
    alejandra # to format nix files.
    pre-commit # to manage git hooks.
  ];

  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes auto-allocate-uids configurable-impure-env
  '';

  networking.networkmanager.enable = true;
  networking.nftables.enable = true; # uses nfttables rather than iptables.
  networking.firewall = {
    #enable = false; # Enables firewall, all ports should be closed.
    enable = true; # Enables firewall, all ports should be closed.
    #TCP 4000 and UDP 1905 for noson (sonos)
    allowedTCPPorts = [22 3389 4000];
    allowedUDPPorts = [67 1905]; # DHCP server TODO move to virtualization section
    trustedInterfaces = ["virbr0"];
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  #  sops.defaultSopsFile = ./../secrets/secrets.yaml;
  #  sops.age.keyFile = "/home/fba/.config/sops/age/keys.txt";
  #  sops.age.generateKey = false;
  #  #sops.secrets.fba_password.neededForUsers = true;
  #  sops.secrets = {
  #    "fba_password" = {};
  #  };
}
