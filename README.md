# Waf NixOS configuration flake.
 This is the configuration repo installing and maintaining NixOS on all my personal
 devices, laptops, servers and virtual machines. This is a work in progress, where
 I learn, make mistakes, and improve. 
 
### TODO
- setup secrets for home-manager:
  - https://github.com/Mic92/sops-nix
  - https://haseebmajid.dev/posts/2024-01-28-how-to-get-sops-nix-working-with-home-manager-modules/
- The configuration layout is not very elegant.  Refactor for desktop and servers.

## Installation on HOST
1. On a new system, boot with NixOS minimum image from a USB key (using Ventoy for example)
2. At the prompt, `sudo -i`
3. Set a password for root
4. Check IP address: `ip a`
5. Adjust IP address in .env
6. Install an authorized key in /root/.ssh: `just remote-ssh-setup HOST`
7. Try to ssh into the host and disconnect: `just remote-ssh HOST`
8. Enable nix extended commands: `just remote-enable-flake HOST`
9. Perform the installation: `just remote-install HOST` 
10. reboot
11. `just remote-ssh HOST`
12. give root and all users a password.

## Local deployment.

## Remote deployment.

## Post-installation.
### All systems.
- Installation of ssh keys.
- When starting Firefox for the first time : 
  - I install Bitwarden add-on, log into it, configure "never lock" and "always autofill". 
  - Then I log into Firefox sync and wait a few minutes.
  - Then I log into Proton VPN
  - Log in LanguageTool
  - Then open all my small bookmarks and log into the services.
- Enabling OneDrive synchronization
```
onedrive # login
onedrive --single-directory Vault --synchronize
systemctl --user enable onedrive@onedrive.service
systemctl --user start onedrive@onedrive.service
systemctl --user status onedrive@onedrive.service
journalctl --user -t onedrive | less
```

### Satori.
- Enable and enroll fingerprint reader for login.

### DisplayLink.
> The procedure described in the NixOS wiki for DisplayLink does not work, displays are not detected. 
```
# https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu-5.8
# Once you have downloaded the file, please use the following
# commands and re-run the installation:

mv $PWD/"DisplayLink USB Graphics Software for Ubuntu5.8-EXE.zip" $PWD/displaylink-580.zip
nix-prefetch-url file:/$PWD/displaylink-580.zip
```
