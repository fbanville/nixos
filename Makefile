############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

deploy:
	sudo nixos-rebuild switch
	#nixos-rebuild switch --flake . --use-remote-sudo

debug:
	nixos-rebuild switch --show-trace --verbose
	#nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

update:
	nix flake update

history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	# remove all generations older than 7 days
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

	# garbage collect all unused nix store entries
	sudo nix store gc --debug

