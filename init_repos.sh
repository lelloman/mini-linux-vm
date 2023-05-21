#!/bin/sh

source ./.config
git clone $BUSYBOX_REMOTE $BUSYBOX_PATH
git clone $LINUX_KERNEL_REMOTE $LINUX_KERNEL_PATH