# work in progress

## Manual Steps

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
