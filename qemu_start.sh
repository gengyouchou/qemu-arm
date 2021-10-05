# cat boot.sh
#! /bin/sh
qemu-system-arm -M vexpress-a9 -m 512M -kernel /home/dptemp/arm/linux-5.10.70/object/arch/arm/boot/zImage -dtb /home/dptemp/arm/linux-5.10.70/object/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -nographic -append "root=/dev/mmcblk0 rw console=ttyAMA0" -sd a9rootfs.ext4 -netdev user,id=mynet0,hostfwd=tcp::${VMN}0023-:23,hostfwd=tcp::${VMN}2376-:2376 -device virtio-net-device,netdev=mynet0 -netdev socket,id=vlan,mcast=230.0.0.1:1234 -device virtio-net-device,netdev=vlan
