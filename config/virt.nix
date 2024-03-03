{ config, pkgs, home-manager, ... }:
{
  virtualisation =  {
#    docker = {
#      enable = true;
#      autoPrune.enable = true;
#      storageDriver = "overlay2";
#      #extraOptions = "--iptables=false";
#    };
    libvirtd.enable = true;
#    waydroid.enable = true;
#    lxd.enable = true;
#    podman = {
#      enable = true;
#      dockerCompat = false; # `docker` alias for podman
#      defaultNetwork.settings.dns_enabled = true; # podman-compose able to talk to each other.
#    };
  };
  
#  virtualisation.oci-containers = {
#    backend = "docker";
#    containers.tresorit = {
#      autoStart = true;
#      image = "tresorit:latest";
#      user = "1000:100";
#      volumes = [
#        "/home/fba/docker/tresorit/Profiles:/home/tresorit/Profiles"
#        "/home/fba/Tresors:/home/tresorit/external"
#      ];
#      environment = {
#        SYNC_ONLY = "true";
#      };
#      extraOptions = [ "--rm" ];
#    };
#  };
}
