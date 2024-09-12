mkdir -p /home/$USER/.config/systemd/user/
curl https://raw.githubusercontent.com/paul-asvb/machine/main/syncthing.service -o  /home/$USER/.config/systemd/user/syncthing.service
systemctl enable --user syncthing.service
systemctl start --user syncthing.service
systemctl status --user syncthing.service
