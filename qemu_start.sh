# cat boot.sh
#! /bin/sh
#VMN=1
sudo qemu-system-arm \
-M vexpress-a9 \
-m 512M \
-nographic \
-device virtio-net-device,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp:127.0.0.1:15555-:8080 \
-kernel /home/dptemp/arm/TFTP_HOME/zImage \
-dtb /home/dptemp/arm/TFTP_HOME/vexpress-v2p-ca9.dtb \
-append "root=/dev/mmcblk0 rw ip=::255.255.255.0 console=ttyAMA0" \
-sd a9rootfs.ext4 \


# sudo qemu-system-arm \
# -M vexpress-a9 \
# -m 512M \
# -nographic \
# -device virtio-net-device,netdev=net0 \
# -netdev user,id=net0,hostfwd=tcp:127.0.0.1:15555-:8080 \
# -kernel /home/dpnums/qemu-arm/TFTP_HOME/zImage \
# -dtb /home/dpnums/qemu-arm/TFTP_HOME/vexpress-v2p-ca9.dtb \
# -append "root=/dev/mmcblk0 rw ip=::255.255.255.0 console=ttyAMA0" \
# -sd a9rootfs.ext4 \

#-net nic -net tap,ifname=tap0,script=no \
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
