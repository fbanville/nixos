{
  config,
  pkgs,
  home-manager,
  ...
}: {
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0" # for foliate
  ];
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Applications
    firefox
    bitwarden-cli
    chromium
    obsidian
    plexamp
    libreoffice
    virt-manager
    foliate
    calibre
    # plex-media-player broken
    celeste
    spacedrive
    handbrake
    asunder
    vlc
    jami
    warp-terminal
    noson
  ];
}
