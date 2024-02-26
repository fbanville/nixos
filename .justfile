
HOSTNAME := `hostname`

# push latest changes to git repo
push:
  git add . --all
  git commit
  git push

# backup current configuration to usb key
backup:
  rsync -arv --delete . /root/tmp

# deploy new configuration
deploy:
  sudo nixos-rebuild switch --flake .#{{HOSTNAME}}

# upgrade nix packages and deploy new configuration
upgrade:
  sudo nix flake update
  sudo nixos-rebuild switch --flake .#{{HOSTNAME}} --upgrade


# Clean up system
clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
