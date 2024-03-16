HOSTNAME := `hostname`

# Default recipe to display help information
default:
  @just --list

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

# Install pre-commit hook for format checking.
hooks:
  pre-commit install

# Clean up system
clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
  # garbage collect all unused nix store entries
  sudo nix store gc --debug

# Refresh firmware and get upgrades
fw-update:
  fwupdmgr --force refresh
  fwupdmgr get-updates 

# Upgrade firmware
fw-upgrade:
  fwupdmgr update

