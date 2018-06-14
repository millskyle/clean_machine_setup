
sudo apt-get install zfs
sudo apt-get install nfs-kernel-server

sudo zpool create -f archive raidz1 \
/dev/disk/by-id/ata-ST8000NM0055-1RM112_ZA129DE5 \
/dev/disk/by-id/ata-ST8000NM0055-1RM112_ZA1407FV \
/dev/disk/by-id/ata-ST8000NM0055-1RM112_ZA140837 \
cache /dev/nvme0n1p1

sudo zfs create archive/01
sudo zfs set compression=lz4 archive/01
sudo zfs set sharenfs=on archive/01
sudo zfs share -a
echo "ZFS_SHARE=\'yes\'" | sudo tee -a /etc/default/zfs
echo "ZFS_UNSHARE=\'yes\'" | sudo tee -a /etc/default/zfs


sudo addgroup archive
sudo chgrp archive /archive/01
sudo chmod 755 /archive/01

sudo adduser kmills archive
sudo adduser itamblyn archive

