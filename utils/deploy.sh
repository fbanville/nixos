
# sudo -i

nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko-config.nix

# for my flake version
# cd <where the flake is> - it should be in /mnt/etc/nixos
nixos-install --flake .#zen
