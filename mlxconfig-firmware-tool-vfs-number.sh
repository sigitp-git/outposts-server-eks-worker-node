[root@ip-10-0-58-16 ~]# wget https://www.mellanox.com/downloads/MFT/mft-4.30.1-113-x86_64-rpm.tgz
--2025-05-23 17:48:30--  https://www.mellanox.com/downloads/MFT/mft-4.30.1-113-x86_64-rpm.tgz
Resolving www.mellanox.com (www.mellanox.com)... 23.212.249.207, 23.212.249.213
Connecting to www.mellanox.com (www.mellanox.com)|23.212.249.207|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://content.mellanox.com/MFT/mft-4.30.1-113-x86_64-rpm.tgz [following]
--2025-05-23 17:48:31--  https://content.mellanox.com/MFT/mft-4.30.1-113-x86_64-rpm.tgz
Resolving content.mellanox.com (content.mellanox.com)... 107.178.241.102
Connecting to content.mellanox.com (content.mellanox.com)|107.178.241.102|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 72012729 (69M) [application/gzip]
Saving to: ‘mft-4.30.1-113-x86_64-rpm.tgz’

mft-4.30.1-113-x86_64-rpm.tgz                  100%[===================================================================================================>]  68.68M   863KB/s    in 81s

2025-05-23 17:49:53 (864 KB/s) - ‘mft-4.30.1-113-x86_64-rpm.tgz’ saved [72012729/72012729]

[root@ip-10-0-58-16 ~]# tar xvf mft-4.30.1-113-x86_64-rpm.tgz
mft-4.30.1-113-x86_64-rpm/LICENSE.txt
mft-4.30.1-113-x86_64-rpm/RPMS/
mft-4.30.1-113-x86_64-rpm/RPMS/mft-4.30.1-113.x86_64.rpm
mft-4.30.1-113-x86_64-rpm/RPMS/mft-oem-4.30.1-113.x86_64.rpm
mft-4.30.1-113-x86_64-rpm/RPMS/mft-autocomplete-4.30.1-113.x86_64.rpm
mft-4.30.1-113-x86_64-rpm/RPMS/mft-pcap-4.30.1-113.x86_64.rpm
mft-4.30.1-113-x86_64-rpm/SDEBS/
mft-4.30.1-113-x86_64-rpm/SDEBS/kernel-mft-dkms_4.30.1-113_all.deb
mft-4.30.1-113-x86_64-rpm/SRPMS/
mft-4.30.1-113-x86_64-rpm/SRPMS/kernel-mft-4.30.1-113.src.rpm
mft-4.30.1-113-x86_64-rpm/install.sh
mft-4.30.1-113-x86_64-rpm/old-mft-uninstall.sh
mft-4.30.1-113-x86_64-rpm/uninstall.sh
[root@ip-10-0-58-16 ~]#
