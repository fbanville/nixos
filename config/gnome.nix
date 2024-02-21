{ config, pkgs, home-manager, ... }:
{
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    #gnome.gnome-boxes
    gnomeExtensions.appindicator
    gnomeExtensions.bing-wallpaper-changer
    gnomeExtensions.transparent-top-bar-adjustable-transparency
    gnomeExtensions.pano
    #gnomeExtensions.weather
    gnomeExtensions.weather-oclock
    #gnomeExtensions.blur-my-shell
    gnomeExtensions.notification-banner-position
    #gnomeExtensions.custom-vpn-toggler
    #gnome.adwaita-icon-theme
    #gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.quick-settings-tweaker
    gnomeExtensions.dash-to-dock
    #gnomeExtensions.dash-to-dock-animator
    #gnomeExtensions.gnome-40-ui-improvements
    #gnomeExtensions.gesture-improvements
    #mojave-gtk-theme
  ];
}
