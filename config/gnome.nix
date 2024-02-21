{ config, pkgs, home-manager, ... }:
{
  services.xserver.xkb = {
    layout = "us";
    xkbVariant = "intl";
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}
