#!/bin/sh

source ./.config

cd $BUSYBOX_PATH
make defconfig
sed -i "s/# CONFIG_STATIC is not set/CONFIG_STATIC=y/g" .config
sed -i "s/# CONFIG_NETCAT is not set/CONFIG_NETCAT=y/g" .config
sed -i "s/# CONFIG_FEATURE_IPV6 is not set/CONFIG_FEATURE_IPV6=y/g" .config
sed -i "s/# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set/CONFIG_FEATURE_IFUPDOWN_IPV6=y/g" .config
sed -i "s/# CONFIG_FEATURE_ETC_NETWORKS is not set/CONFIG_FEATURE_ETC_NETWORKS=y/g" .config
CONFIG_FEATURE_ETC_NETWORKS
make -j$(nproc)

cd $SCRIPTPATH