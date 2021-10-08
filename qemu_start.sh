# cat boot.sh
#! /bin/sh
#VMN=1
sudo qemu-system-arm \
-M vexpress-a9 \
-m 512M \
-nographic \
-net nic -net tap,ifname=tap0,script=no \
-kernel /home/dptemp/arm/u-boot-2018.11/u-boot \
#-dtb ./linux-5.10.70/object/arch/arm/boot/dts/vexpress-v2p-ca9.dtb
#-sd a9rootfs.ext4
#-drive if=pflash,format=raw,index=1,file=/home/dptemp/TFTP_HOME/flash.img
#-smp sockets=1,cpus=4,cores=2 \

#-dtb ./linux-5.10.70/object/arch/arm/boot/dts/vexpress-v2p-ca9.dtb \

#-append "root=/dev/mmcblk0 rw console=ttyAMA0" \
#-sd a9rootfs.ext4 \

#-netdev user,id=mynet0,hostfwd=tcp::${VMN}0023-:23,hostfwd=tcp::${VMN}2376-:2376 \
#-device virtio-net-device,netdev=mynet0 \
#-netdev socket,id=vlan,mcast=230.0.0.1:1234 \
#-device virtio-net-device,netdev=vlan
#-netdev tap,id=mynet0
