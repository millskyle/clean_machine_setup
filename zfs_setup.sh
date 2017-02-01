
sudo zpool create -f archive raidz1 \
/dev/disk/by-id/ata-ST8000NM0055-1RM112_ZA1407ME \
/dev/disk/by-id/ata-ST8000NM0055-1RM112_ZA1407T7 \
/dev/disk/by-id/ata-ST8000NM0055-1RM112_ZA1407MJ \
cache /dev/nvme0n1p1

sudo zfs create archive/01
sudo zfs set compression=lz4 archive/01

sudo addgroup archive
sudo chgrp archive /archive/01
sudo chown archive /archive/01
sudo chmod 755 /archive/01

sudo adduser kmills archive
sudo adduser itamblyn archive


