#!/bin/env bash
# Comando que você deseja executar
update="sudo apt update && sudo apt upgrade && sudo apt autoremove && pacstall -U && pacstall -Up"

rsync="rsync -avu --delete "/home/edu/Sync/" "/home/edu/Rclone/Adventista/Syncthing""

# Abrir o terminal Alacritty e executar o comando
alacritty -e bash -c "$rsync" & alacritty -e bash -c "$update"
