#!/usr/bin/env bash

dirs=("Documentos" "Imagens" "Videos")
dirsConfig=("alacritty" "mpd" "ncmpcpp" "Qbittorrent" "rclone")

ln -s ~/Sync/default/Músicas ~/
ln -s ~/Sync/home/.config/systemd/user/rclone-adventista.service ~/.config/systemd/user
ln -s ~/Sync/home/.config/systemd/user/rclone-personal.service ~/.config/systemd/user

for a in ${dirs[@]}; do 
	ln -s ~/Sync/home/$a ~/$a
done

for a in ${dirsConfig[@]}; do 
	ln -s ~/Sync/home/.config/$a ~/.config/$a
done

mkdir ~/.local/rclone
mkdir -p ~/.local/rclone/adventista
mkdir -p ~/.local/rclone/personal

sudo systemctl enable --now syncthing@edu.service
