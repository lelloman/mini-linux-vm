#!/bin/sh

source ./.config

cd $LINUX_KERNEL_PATH
make mrproper
cp $SCRIPTPATH/.config-linux-6.3 .config
make -j$(nproc)

cd $BUSYBOX_PATH
make defconfig
sed -i "s/# CONFIG_STATIC is not set/CONFIG_STATIC=y/g" .config
make -j$(nproc)

cd $SCRIPTPATH