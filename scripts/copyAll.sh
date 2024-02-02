#!/usr/bin/env bash
#


git clone https://github.com/EduardoSilvaDiniz/Dotfiles.git
cd Dotfiles
cp -r xorg.conf.d /etc/X11/
cp -r redshift /home/edu/.config
cp wallpaper.png /home/edu/Imagens/
cp -r nvim /home/edu/.config/
cp .aliases .zshenv /home/edu/
