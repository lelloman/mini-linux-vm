#!/bin/sh

source ./.config

sudo qemu-system-x86_64 \
  -kernel $LINUX_KERNEL_PATH/arch/x86_64/boot/bzImage \
  -nographic \
  -drive format=raw,file=rootfs.ext2,if=virtio \
  -append "root=/dev/vda console=ttyS0 nokaslr netconsole=4444@10.0.2.15/eth0,6666@10.0.2.2/58:11:22:2a:2e:fd" \
  -display none \
  -m 1G \
  -enable-kvm \
  -smp 4 \
  -device e1000,netdev=eth0 \
  -netdev user,id=eth0,hostfwd=tcp::5555-:22,hostfwd=udp::6666-:6667,hostfwd=tcp::3333-:4444,hostfwd=tcp::6668-:23 \
  -cpu host \
  -virtfs local,path=shared,mount_tag=host0,security_model=passthrough,id=host0 \

#-append "root=/dev/vda console=ttyS0 nokaslr cgroup_no_v1=all systemd.unified_cgroup_hierachy=1 netconsole=4444@10.0.2.15/eth0,6665@10.0.2"
#  -drive format=raw,file=swap1.img,if=virtio \
#  -drive format=raw,file=swap1.img,if=virtio \
#  -virtfs local,path=linux,mount_tag=host1,security_model=passthrough,id=host1 \
