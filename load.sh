sudo mount -o loop ./a9rootfs.ext4 tmpfs/  
cp ./socket_arm/client tmpfs/ 
sudo umount tmpfs 
