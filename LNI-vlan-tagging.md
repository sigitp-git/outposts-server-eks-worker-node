LNI on the host OS will be seen as another Linux interface, for example this is a lab where LNI is mapped to ens7 by the OS:
 
ec2-user@ip-172-31-150-218:~$ lspci | grep ENA
00:05.0 Ethernet controller: Amazon.com, Inc. Elastic Network Adapter (ENA)
00:06.0 Ethernet controller: Amazon.com, Inc. Elastic Network Adapter (ENA)
00:07.0 Ethernet controller: Amazon.com, Inc. Elastic Network Adapter (ENA)  LNI
 
ec2-user@ip-172-31-150-218:~$ ls -l /sys/class/net | awk '{print $9, $10, $11}' | grep "00:07.0"
ens7 -> ../../devices/pci0000:00/0000:00:07.0/net/ens7
 
ec2-user@ip-172-31-150-218:~$ ifconfig ens7
ens7: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
ether 0a:ff:ff:02:58:ef txqueuelen 1000 (Ethernet)
RX packets 7445701 bytes 313001642 (313.0 MB)
RX errors 0 dropped 0 overruns 0 frame 0
TX packets 202 bytes 14320 (14.3 KB)
TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0
 
Then you can VLAN tag that ens7, so it will take multiple subnets:
https://docs.aws.amazon.com/outposts/latest/server-userguide/local-server.html#:~:text=Example%3A%20To%20configure%20VLAN%20tagging%20for%20your%20LNI%20on%20Amazon%20Linux%202023%20and%20Amazon%20Linux%202
Ensure that the 8021q module is loaded into the kernel. If not, load it using the modprobe command.
 
ec2-user@ip-172-31-150-218:~$ modinfo 8021q
ec2-user@ip-172-31-150-218:~$ modprobe --first-time 8021q
 
Create the VLAN device. In this example:
The interface name of the LNI is ens7
The VLAN id is 59
The name assigned for the VLAN device will be ens7.59
 
ec2-user@ip-172-31-150-218:~$ ip link add link ens7 name ens7.59 type vlan id 59
 
Optional. Complete this step if you want to manually assign the IP. In this example we are assigning the IP 192.168.59.205, where the subnet CIDR is 192.168.59.0/24 for VLAN 59.
 
ec2-user@ip-172-31-150-218:~$ ip addr add 192.168.59.205/24 brd 192.168.59.255 dev ens7.59
 
Activate the link.
 
ip link set dev ens7.59 up
 
To configure your network interfaces at the OS level and make the VLAN tagging changes persistent, refer to the following resources:
·         If you are using Amazon Linux 2, see Configure your network interface using ec2-net-utils for Amazon Linux in the Amazon EC2 User Guide. https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/best-practices-for-configuring-network-interfaces.html#ec2-net-utils
·         If you are using Amazon Linux 2023, see Networking service in the Amazon Linux 2023 User Guide. https://docs.aws.amazon.com/linux/al2023/ug/networking-service.html 
 
