{
  config,
  pkgs,
  home-manager,
  ...
}: {
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [hplipWithPlugin];
  hardware.sane.enable = true;
  hardware.sane.extraBackends = with pkgs; [hplipWithPlugin];
}
