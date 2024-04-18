https://github.com/aws/amazon-vpc-cni-k8s/blob/master/misc/eni-max-pods.txt

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI


[cloudshell-user@ip-10-130-83-34 ~]$ aws ec2 describe-instance-types --filters "Name=instance-type,Values=c5.*" --query "InstanceTypes[].{Type: InstanceType, MaxENI: NetworkInfo.MaximumNetworkInterfaces, IPv4addrPerENI: NetworkInfo.Ipv4AddressesPerInterface}" --output table
---------------------------------------------
|           DescribeInstanceTypes           |
+-----------------+---------+---------------+
| IPv4addrPerENI  | MaxENI  |     Type      |
+-----------------+---------+---------------+
|  30             |  8      |  c5.4xlarge   |
|  15             |  4      |  c5.xlarge    |
|  30             |  8      |  c5.12xlarge  |
|  50             |  15     |  c5.24xlarge  |
|  50             |  15     |  c5.metal     |
|  30             |  8      |  c5.9xlarge   |
|  15             |  4      |  c5.2xlarge   |
|  10             |  3      |  c5.large     |
|  50             |  15     |  c5.18xlarge  |
+-----------------+---------+---------------+
[cloudshell-user@ip-10-130-83-34 ~]$ 



[cloudshell-user@ip-10-130-83-34 ~]$ aws ec2 describe-instance-types --filters "Name=instance-type,Values=c6gd.*" --query "InstanceTypes[].{Type: InstanceType, MaxENI: NetworkInfo.MaximumNetworkInterfaces, IPv4addrPerENI: NetworkInfo.Ipv4AddressesPerInterface}" --output table
-----------------------------------------------
|            DescribeInstanceTypes            |
+-----------------+---------+-----------------+
| IPv4addrPerENI  | MaxENI  |      Type       |
+-----------------+---------+-----------------+
|  50             |  15     |  c6gd.metal     |
|  15             |  4      |  c6gd.xlarge    |
|  50             |  15     |  c6gd.16xlarge  |
|  30             |  8      |  c6gd.4xlarge   |
|  4              |  2      |  c6gd.medium    |
|  15             |  4      |  c6gd.2xlarge   |
|  30             |  8      |  c6gd.8xlarge   |
|  30             |  8      |  c6gd.12xlarge  |
|  10             |  3      |  c6gd.large     |
+-----------------+---------+-----------------+
[cloudshell-user@ip-10-130-83-34 ~]$ 
