{
  config,
  pkgs,
  home-manager,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zola
  ];
}
