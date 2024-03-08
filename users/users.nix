{
  config,
  pkgs,
  home-manager,
  ...
}: {
  #sops.secrets.fba_password.neededForUsers = true;
  users.users.fba = {
    isNormalUser = true;
    #hashedPasswordFile = config.sops.secrets.fba_password.path;
    description = "François Banville";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "kvm"
      "audio"
      "disk"
      "video"
      "network"
      "systemd-journal"
      "lp"
      "scanner"
    ];
    openssh.authorizedKeys.keys = [
      # mac
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRneZjuzVFrlbbnpiRVBcsQ2DH+hTVq6aE5tvyww0cU waf@banber.org"
    ];
  };
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = ["fba"];
        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD" "SETENV"];
          }
        ];
      }
    ];
  };
}
