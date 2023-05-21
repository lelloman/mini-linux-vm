#!/bin/sh

source ./.config

dd if=/dev/zero of=rootfs.ext2 bs=1M count=100
mkfs.ext4 rootfs.ext2
sudo mkdir /mnt
sudo mount rootfs.ext2 /mnt
sudo cp -a staging/* /mnt
sudo mkdir /mnt/proc
sudo mkdir /mnt/sys
sudo mkdir /mnt/tmp
sudo mkdir /mnt/run
sudo mkdir /mnt/shared
sudo echo $HOSTNAME >> /mnt/etc/hostname

cd $BUSYBOX_PATH
sudo make CONFIG_PREFIX="/mnt" install
cd $SCRIPTPATH

sudo umount /mnt