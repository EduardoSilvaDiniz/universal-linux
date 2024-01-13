#!/usr/bin/env sh

dirs=("Documents" "Pictures" "Media" ".emacs.d" ".doom.d")
dirsConfig=("alacritty" "mpd" "ncmpcpp" "Qbittorrent")

ln -s ~/Sync/default/Music ~/Music

for a in ${dirs[@]}; do ln -s ~/Sync/home/$a ~/$a
done

for a in ${dirsConfig[@]}; do ln -s ~/Sync/home/.config/$a ~/.config/$a
done

mkdir ~/Rclone
mkdir -p ~/Rclone/adventista
mkdir -p ~/Rclone/personal

#TODO descobrir qual é gerenciador de serviço e adiciona o serviço da forma correta e ativar
#systemD
#sudo systemctl enable --now syncthing@edu.service
#openRC
