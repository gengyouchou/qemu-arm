sudo qemu-system-aarch64 -M virt -cpu cortex-a57 -m 2048 \
-device virtio-net-pci,netdev=net0,romfile="" \
-netdev type=user,id=net0 \
-device virtio-blk-pci,drive=drv0 \
-object rng-random,filename=/dev/urandom,id=rng0 \
-device virtio-rng-pci,rng=rng0 \
-drive format=qcow2,file=hda.qcow2,if=none,id=drv0 \
-drive if=pflash,format=raw,file=flash0.img,readonly \
-drive if=pflash,format=raw,file=flash1.img \
-nographic
