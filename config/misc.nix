{
  config,
  pkgs,
  home-manager,
  ...
}: {
  services.tailscale.enable = true;
  services.flatpak.enable = true;
  services.onedrive.enable = true;
  programs.steam.enable = true;
}
