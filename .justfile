set dotenv-load

HOSTNAME := `hostname`

key := "install/id_ed25519_satori.pub"

# available recipies.
default:
  @just --list --unsorted

# push latest changes to git repo.
push:
  git add . --all
  git commit
  git push

# format all nix files
format:
  alejandra .

# deploy new configuration.
deploy:
  sudo nixos-rebuild switch --flake .#{{HOSTNAME}}

# upgrade nix packages and deploy new configuration.
upgrade:
  sudo nix flake update
  sudo nixos-rebuild switch --flake .#{{HOSTNAME}} --upgrade

# install pre-commit hook for format checking.
hooks:
  pre-commit install

# remove unused nix store entries and older profiles.
clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
  # garbage collect all unused nix store entries
  sudo nix store gc --debug

# refresh firmware sources.
fw-update:
  sudo fwupdmgr --force refresh
  sudo fwupdmgr get-updates 

# upgrade firmware.
fw-upgrade:
  sudo fwupdmgr update

# install an authorized key on remote host.
remote-ssh-setup host:
  sed -i "i/${{ host }}_ip/d" ~/.ssh/known_hosts
  ssh-copy-id -f -i {{ key }} root@${{ host }}_ip

# connect to remote host.
remote-ssh host:
  sed -i "/${{ host }}_ip/d" ~/.ssh/known_hosts
  ssh root@${{ host }}_ip

# enable nix flakes on remote host.
remote-flakes host:
  ssh root@${{ host }}_ip mkdir -p /root/.config/nix
  ssh root@${{ host }}_ip "echo \"experimental-features = nix-command flakes\" >> /root/.config/nix/nix.conf"

# generate a starting nixos configuration on remote host.
remote-generate-config host:
  ssh root@${{ host }}_ip nixos-generate-config --no-filesystems --root /mnt

# test configuration for remote host.
remote-test-config host:
  nix run github:nix-community/nixos-anywhere -- --flake .#{{ host }} --vm-test

# perform a remote nixos install.
remote-install host:
  nix run github:nix-community/nixos-anywhere -- --flake '.#{{ host }}' root@${{ host }}_ip

# perform a remote deployment
remote-deploy host:
  nixos-rebuild --flake .#{{ host }} --target-host root@4{{ host }}_ip switch

# perform a remote deployment
remote-deploy-debug host:
  nixos-rebuild --flake .#{{ host }} --target-host root@${{ host }}_ip switch --show-trace --option eval-cache false
  
