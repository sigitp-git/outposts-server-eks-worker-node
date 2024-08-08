## c6id.8xlarge
[root@ip-172-31-155-51 bin]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
nvme0n1       259:0    0  1.7T  0 disk
├─nvme0n1p1   259:1    0  1.7T  0 part /
├─nvme0n1p127 259:2    0    1M  0 part
└─nvme0n1p128 259:3    0   10M  0 part /boot/efi
[root@ip-172-31-155-51 bin]#

## c6id.32xlarge
root@ip-172-31-104-170:~# lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0          7:0    0 25.2M  1 loop /snap/amazon-ssm-agent/7983
loop1          7:1    0 50.3M  1 loop /snap/aws-cli/428
loop2          7:2    0 63.9M  1 loop /snap/core20/2182
loop3          7:3    0 11.7M  1 loop /snap/kubectl-eks/203
loop4          7:4    0 55.7M  1 loop /snap/core18/2812
loop5          7:5    0 74.2M  1 loop /snap/core22/1122
loop6          7:6    0  3.9M  1 loop /snap/ecr-credential-provider/3
loop7          7:7    0 21.1M  1 loop /snap/kubelet-eks/204
loop8          7:8    0 39.1M  1 loop /snap/snapd/21184
nvme0n1      259:0    0  1.7T  0 disk
nvme2n1      259:1    0  1.7T  0 disk
nvme1n1      259:2    0  1.7T  0 disk
nvme3n1      259:3    0  1.7T  0 disk
├─nvme3n1p1  259:4    0  1.7T  0 part /
├─nvme3n1p14 259:5    0    4M  0 part
└─nvme3n1p15 259:6    0  106M  0 part /boot/efi
root@ip-172-31-104-170:~#
