#!/bin/sh

source ./.config

cd $LINUX_KERNEL_PATH
make mrproper
cp $SCRIPTPATH/.config-linux-6.3 .config
make -j$(nproc)
cd $SCRIPTPATH

./build_busybox.sh