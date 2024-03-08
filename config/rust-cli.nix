{
  config,
  pkgs,
  home-manager,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # rust cli replacement
    bat # cat
    glow # markdown display
    eza # ls
    procs # ps
    sd # sed
    du-dust # du
    ripgrep # grep
    bottom # top
    tealdeer # tldr
    bandwhich # bandwidt by process
    felix # tui file manager
    inlyne # markdown browser
    lfs # df
    rm-improved # rm
    rnr # rename
    xh # curl, wget
    xcp # cp
    zoxide # cd
  ];
}
