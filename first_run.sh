#!/bin/sh

./init_repos.sh
./build_repos.sh
./build_rootfs_stage.sh
./build_rootfs_image.sh
./run.sh