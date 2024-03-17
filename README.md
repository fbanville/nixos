# Waf NixOS configuration flake.
 This is the configuration repo installing and maintaining NixOS on  all my personal
 devices, laptops, servers and virtual machines. This is a work in progress, where
 I learn, make mistakes, and improve. hsu hhwed   qewewjd h jewked d  
 
### TODO
- setup secrets for home-manager:
  - https://github.com/Mic92/sops-nix
  - https://haseebmajid.dev/posts/2024-01-28-how-to-get-sops-nix-working-with-home-manager-modules/
  - refactor for desktop and servers.

## Installation 
1. On a new system, boot with nixos minimum image from a usb key (using Ventoy for example)
2. At the prompt, sudo -i
3. Set a password for root
4. Install an authorized key in /root/.ssh: just remote-ssh-setup
5. Try to ssh into the machime and disconnect: just remote-ssh
6. Enable nix extended commands: just remote-enable-flake


Manual Step

### All systems
- installation of ssh keys.
- when starting firefox for the first time : 
  - I install bitwarden addon, log into it, configure "never lock" and "always autofill". 
  - Then I log into firefox sync and wait a few minutes.
  - Then I log into Proton VPN
  - Log in LanguageTool
  - Then open all my small bookmarks and log into the services.
- Enabling onedrive synchronization
```
onedrive # then log using Gartner credentials
onedrive --single-directory Vault --synchronize
systemctl --user enable onedrive@onedrive.service
systemctl --user start onedrive@onedrive.service
systemctl --user status onedrive@onedrive.service
journalctl --user -t onedrive | less
```

### Satori
- enable and enroll fingerprint reader for login.

### DisplayLink

       > https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu-5.8
       >
       > Once you have downloaded the file, please use the following
       > commands and re-run the installation:
       >
       > mv $PWD/"DisplayLink USB Graphics Software for Ubuntu5.8-EXE.zip" $PWD/displaylink-580.zip
       > nix-prefetch-url file:/$PWD/displaylink-580.zip
       >

