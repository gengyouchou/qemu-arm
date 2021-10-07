# cat boot.sh
#! /bin/sh
VMN=1
sudo qemu-system-arm \
-M vexpress-a9 \
-smp sockets=1,cpus=4,cores=2 \
-m 512M \
-kernel ./linux-5.10.70/object/arch/arm/boot/zImage \
-dtb ./linux-5.10.70/object/arch/arm/boot/dts/vexpress-v2p-ca9.dtb \
-nographic \
-append "root=/dev/mmcblk0 rw console=ttyAMA0" \
-sd a9rootfs.ext4 \
-netdev user,id=mynet0,hostfwd=tcp::${VMN}0022-:22,hostfwd=tcp::${VMN}2375-:2375 \
-device virtio-net-device,netdev=mynet0 \
-netdev socket,id=vlan,mcast=230.0.0.1:1234 \
-device virtio-net-device,netdev=vlan
#-netdev tap,id=mynet0

