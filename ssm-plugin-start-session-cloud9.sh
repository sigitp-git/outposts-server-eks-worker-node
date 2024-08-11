### https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
### The Cloud9 instance must have an SSM IAM policy that allows starting a session

Admin:~/environment $ uname -a
Linux ip-172-31-64-57 6.5.0-1023-aws #23~22.04.1-Ubuntu SMP Fri Jun 21 19:23:45 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

Admin:~/environment $ curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 3728k  100 3728k    0     0  38.0M      0 --:--:-- --:--:-- --:--:-- 38.3M

Admin:~/environment $ sudo dpkg -i session-manager-plugin.deb
Selecting previously unselected package session-manager-plugin.
(Reading database ... 77292 files and directories currently installed.)
Preparing to unpack session-manager-plugin.deb ...
Preparing for install
Unpacking session-manager-plugin (1.2.650.0-1) ...
Setting up session-manager-plugin (1.2.650.0-1) ...
Creating symbolic link for session-manager-plugin

Admin:~/environment $ kubectl get node
NAME                             STATUS   ROLES    AGE     VERSION
ip-172-31-148-193.ec2.internal   Ready    <none>   3h59m   v1.29.6-eks-1552ad0
ip-172-31-151-219.ec2.internal   Ready    <none>   3h53m   v1.29.6-eks-1552ad0
ip-172-31-152-24.ec2.internal    Ready    <none>   169m    v1.29.6-eks-1552ad0
ip-172-31-156-11.ec2.internal    Ready    <none>   3h52m   v1.29.6-eks-1552ad0

Admin:~/environment $ kubectl describe node ip-172-31-148-193.ec2.internal | grep ProviderID
ProviderID:                   aws:///us-east-1d/i-063eb2f1e23588223
Admin:~/environment $ 

Admin:~/environment $ aws ssm start-session --target i-063eb2f1e23588223
Starting session with SessionId: i-0c9fe2ee9c90db8c6-ags4ieyoutxtbjbon3ea44socy
sh-5.2$ 

## shorter with --t
Admin:~/environment $ aws ssm start-session --t i-063eb2f1e23588223
Starting session with SessionId: i-0c9fe2ee9c90db8c6-ags4ieyoutxtbjbon3ea44socy
sh-5.2$ 


### enable SSH and SCP over SSM
### https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-getting-started-enable-ssh-connections.html
### add config lines below

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
