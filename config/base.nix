{ config, pkgs, home-manager, ... }:
{
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  environment.systemPackages = with pkgs; [
    just
    neovim
    zellij
    git
    vim
    fastfetch
    age
    sops
  ];
  sops.defaultSopsFile = ./../secrets/secrets.yaml;
  sops.age.keyFile = "/root/.config/sops/age/keys.txt";
  sops.age.generateKey = false;
  #sops.secrets.fba_password.neededForUsers = true;
  sops.secrets = {
#    "fba_password" = {};
  };
}
