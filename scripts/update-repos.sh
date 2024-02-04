#!/usr/bin/env bash

dirs=$(ls ~/Git/)
dateCurrent=$(date)

for a in ${dirs[@]}; do 
	cd ~/Git/$a && git add . && git commit -m "script update-repo date: $dateCurrent" && git push || \
		echo "error git $a" >> ~/update-repo.log
done
