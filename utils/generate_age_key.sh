mkdir -p /home/fba/.config/sops/age && age-keygen -o /home/fba/.config/sops/age/keys.txt
sudo mkdir -p /root/.config/sops/age && sudo cp /home/fba/.config/sops/age/keys.txt /root/.config/sops/age/keys.txt
