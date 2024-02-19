{ config, pkgs, home-manager, ... }:
{
  sops.secrets.fba_password.neededForUsers = true;
  users.users.fba = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.fba_password.path;
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
    	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZk9PfNFXET5zpU9gOjrJd6vgaq+ig+SESxqxbLpm+vY5hU1G7cmBmxP0F8oLoeb5qciwud0hmrxG55PEhQOzFT52wNO3kwn3JBUfnKkHz1I7wQOeAsbxwcuv2w7X8f9bSfwOUQf5FvFEhMo+Iy7UUoAFixh5EqhGbIrPmCmo+lz3szJPS39OhoQ+GenKeRWb4/hezEamvpzlKQ4ySeNSUrC9OpCboe/eCWhs1wsOl9GkTGWNoPEJhnewq0x5p8sGmREHsBDXDQQgywdPyAyN6lq7Z10/4seiZzTnPnkAHT6q2wv2ydYGmet2Kwp9RuXaqHZ7ecU+FUQmqH2+qs/wID11GYjsIEVHCpDv+ac/BMvQyDjhUNsOF5Gdd1pc7OxrQEfo/rKweNbTqZot3gr/51GvlsW67wegBVQuVT9fq99Jghz36BwAYX/rc/C8RI7hPcFX1VsDlw5IAN0U8frEigoM6wnau9L5tdOQH2C9t/RNZuRzc0QaEZLNXMENhBAkzU8uIh+3wbEzvYrvC+YsQ3I6SVDj+B+t7HeAAeTP730luiqDtsINACq9+1iW/zlMyHjn7ORDSLohU7g8U5ej9sqne5pr+bpcuNAE8gagwpcBb3O8nf8Mm7HBldWHhGaL5RYTb0BkKqoDzbSwR6HzlGHTrnpa8GHunTgZcwTWZbw== fbanvill@H507MVTG7P"
    ];

  };
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "fba" ];
        commands = [
          { 
            command = "ALL" ;
            options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
          }
        ];
      }
    ];
  };
}
