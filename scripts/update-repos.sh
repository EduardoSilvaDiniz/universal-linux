#!/usr/bin/env bash

dirs=$(ls ~/Git/)
dateCurrent=$(date)
#TODO adiciona tratamento de erros

for a in ${dirs[@]}; do 
	cd ~/Git/$a && git add . && git commit -m "autocommit (script update-repo) date: $dateCurrent" && git push || \
	echo "error git $a" >> ~/update-repo.log
done
mineDir="/home/edu/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances/Better_than_Adventure_7.1_Prerelease_1a (1)/.minecraft/saves/BTA-save"

cd ~/$mineDir/Better_than_Adventure_7.1_Prerelease_1a (1)/.minecraft/saves/BTA-save && git add . && git commit -m "autocommit (script update-repo) date: $dateCurrent" && git push || \
	echo "error git $a" >> ~/update-repo.log
