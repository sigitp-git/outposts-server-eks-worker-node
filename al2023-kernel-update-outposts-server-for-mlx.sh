### AL2023 Kernel update for MLX

Admin:~/environment $ cat ../.ssh/config 
host i-* mi-*
ProxyCommand sh -c "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"
Admin:~/environment $ 

### SSH over SSM
Admin:~/environment $ ssh -i 5gc-pmt-keypair.pem ec2-user@i-063eb2f1e23588223
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
Last login: Sun Aug 11 18:07:23 2024 from 127.0.0.1
[ec2-user@ip-172-31-148-193 ~]$ 

### SCP over SSM
Admin:~/environment $ scp -i 5gc-pmt-keypair.pem ./kernel-6.1.103-111.183.amzn2023.x86_64.rpm ec2-user@i-063eb2f1e23588223:/home/ec2-user
kernel-6.1.103-111.183.amzn2023.x86_64.rpm                                                                                                               100%   32MB 754.4KB/s   00:43    
Admin:~/environment $ 

### check kernel
Admin:~/environment $ ssh -i 5gc-pmt-keypair.pem ec2-user@i-063eb2f1e23588223
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
Last login: Sun Aug 11 18:13:09 2024
[ec2-user@ip-172-31-148-193 ~]$ ls
kernel-6.1.103-111.183.amzn2023.x86_64.rpm  pcie_ep_octeon_host

[ec2-user@ip-172-31-148-193 ~]$ uname -r
6.1.102-108.177.amzn2023.x86_64

[ec2-user@ip-172-31-148-193 ~]$ lsmod | grep mlx

[ec2-user@ip-172-31-148-193 ~]$ grep MLX /boot/config-6.1.102-108.177.amzn2023.x86_64 
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_MLX_PLATFORM is not set
[ec2-user@ip-172-31-148-193 ~]$ 

[ec2-user@ip-172-31-148-193 ~]$ sudo modprobe mlx5_core
modprobe: FATAL: Module mlx5_core not found in directory /lib/modules/6.1.102-108.177.amzn2023.x86_64
[ec2-user@ip-172-31-148-193 ~]$ sudo modprobe mlx5_ib
modprobe: FATAL: Module mlx5_ib not found in directory /lib/modules/6.1.102-108.177.amzn2023.x86_64
[ec2-user@ip-172-31-148-193 ~]$ 


### KERNEL UPDATE AND RESTART
[ec2-user@ip-172-31-148-193 ~]$ sudo rpm -ivh kernel-6.1.103-111.183.amzn2023.x86_64.rpm 
Verifying...                          ################################# [100%]
Preparing...                          ################################# [100%]
Updating / installing...
   1:kernel-6.1.103-111.183.amzn2023  ################################# [100%]
Checking Secure Boot revocations...
efivar: show variable: Function not implemented
Not a UEFI instance
[ec2-user@ip-172-31-148-193 ~]$ 

[ec2-user@ip-172-31-148-193 ~]$ uname -r
6.1.102-108.177.amzn2023.x86_64
[ec2-user@ip-172-31-148-193 ~]$ 

### RESTART, ITS OK FOR OUTPOSTS SERVER WITH INSTANCE STORE
[ec2-user@ip-172-31-148-193 ~]$ sudo shutdown -r now

Broadcast message from root@localhost on pts/1 (Sun 2024-08-11 18:19:47 UTC):

The system will reboot now!

[ec2-user@ip-172-31-148-193 ~]$ Bad packet length 590058812.
ssh_dispatch_run_fatal: Connection to UNKNOWN port 65535: Connection corrupted
Admin:~/environment $ 


### LOGIN BACK AFTER RESTART COMPLETED
Admin:~/environment $ ssh -i 5gc-pmt-keypair.pem ec2-user@i-063eb2f1e23588223
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
Last login: Sun Aug 11 18:13:44 2024 from 127.0.0.1
[ec2-user@ip-172-31-148-193 ~]$ 

[ec2-user@ip-172-31-148-193 ~]$ uname -r
6.1.103-111.183.amzn2023.x86_64
[ec2-user@ip-172-31-148-193 ~]$ lsmod | grep mlx
[ec2-user@ip-172-31-148-193 ~]$ sudo modprobe mlx5_core
[ec2-user@ip-172-31-148-193 ~]$ sudo modprobe mlx5_ib
[ec2-user@ip-172-31-148-193 ~]$ lsmod | grep mlx
mlx5_ib               421888  0
ib_uverbs             180224  1 mlx5_ib
ib_core               454656  2 ib_uverbs,mlx5_ib
mlx5_core            1085440  1 mlx5_ib
[ec2-user@ip-172-31-148-193 ~]$ grep MLX /boot/config-6.1.10
config-6.1.102-108.177.amzn2023.x86_64  config-6.1.103-111.183.amzn2023.x86_64  
[ec2-user@ip-172-31-148-193 ~]$ grep MLX /boot/config-6.1.103-111.183.amzn2023.x86_64 
# CONFIG_MLX4_EN is not set
CONFIG_MLX5_CORE=m
CONFIG_MLX5_FPGA=y
CONFIG_MLX5_CORE_EN=y
CONFIG_MLX5_EN_ARFS=y
CONFIG_MLX5_EN_RXNFC=y
CONFIG_MLX5_MPFS=y
CONFIG_MLX5_CORE_EN_DCB=y
CONFIG_MLX5_CORE_IPOIB=y
CONFIG_MLX5_EN_IPSEC=y
CONFIG_MLX5_SF=y
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_MLX4_INFINIBAND is not set
CONFIG_MLX5_INFINIBAND=m
# CONFIG_MLX5_VFIO_PCI is not set
# CONFIG_MLX_PLATFORM is not set
[ec2-user@ip-172-31-148-193 ~]$ 
