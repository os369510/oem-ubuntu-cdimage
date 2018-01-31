#!/bin/sh

echo "[BUILD] - Generate new filesystem.squashfs with the updated ubuntu-archive-keyring.gpg"
sudo rm temp -rf filesystem.squashfs
mkdir temp
cd temp
sudo unsquashfs ../$1
cd squashfs-root
sudo cp $2/ubuntu-keyring-2012.05.19/keyrings/ubuntu-archive-keyring.gpg usr/share/keyrings/ubuntu-archive-keyring.gpg
sudo cp $2/ubuntu-keyring-2012.05.19/keyrings/ubuntu-archive-keyring.gpg etc/apt/trusted.gpg
sudo mksquashfs ./ ../../filesystem.squashfs
sudo chown $USER:$USER ../../filesystem.squashfs
sudo du -sx --block-size=1 ./ | cut -f1 > ../../filesystem.size 

