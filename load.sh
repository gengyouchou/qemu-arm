mkdir -p rootfs/dev
mkdir -p rootfs/etc/init.d

sudo mknod rootfs/dev/tty1 c 4 1
sudo mknod rootfs/dev/tty2 c 4 2
sudo mknod rootfs/dev/tty3 c 4 3
sudo mknod rootfs/dev/tty4 c 4 4

dd if=/dev/zero of=a9rootfs.ext4 bs=1M count=32

mkfs.ext4 a9rootfs.ext4


if [ -d "./tmpfs" ]; then
    # 目錄 /path/to/dir 存在
    echo "Directory ./tmpfs exists."
else
    # 目錄 /path/to/dir 不存在
    sudo mkdir tmpfs
fi


sudo mount -t ext4 a9rootfs.ext4 tmpfs/ -o loop
sudo cp -r rootfs/*  tmpfs/
sudo umount tmpfs

