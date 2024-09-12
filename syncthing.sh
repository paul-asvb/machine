mkdir -p /home/$USER/.config/systemd/user/
cp ./syncthing.service /home/$USER/.config/systemd/user/syncthing.service

systemctl enable --user syncthing.service
systemctl start --user syncthing.service
systemctl status --user syncthing.service
