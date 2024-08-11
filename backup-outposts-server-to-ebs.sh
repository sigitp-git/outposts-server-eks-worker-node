### https://github.com/aws-samples/backup-outposts-servers-linux-instance

### on the node, install rsync
sh-5.2$ sudo yum install rsync -y
===========================================================================================================================================================================================
 Package                                     Architecture                           Version                                              Repository                                   Size
===========================================================================================================================================================================================
Installing:
 rsync                                       x86_64                                 3.2.6-1.amzn2023.0.3                                 amazonlinux                                 410 k
Installing dependencies:
 xxhash-libs                                 x86_64                                 0.8.0-3.amzn2023.0.2                                 amazonlinux                                  40 k

Transaction Summary
===========================================================================================================================================================================================
Install  2 Packages

Total download size: 450 k
Installed size: 858 k
Downloading Packages:
(1/2): xxhash-libs-0.8.0-3.amzn2023.0.2.x86_64.rpm                                                                                                         133 kB/s |  40 kB     00:00    
(2/2): rsync-3.2.6-1.amzn2023.0.3.x86_64.rpm                                                                                                               718 kB/s | 410 kB     00:00    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                      523 kB/s | 450 kB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                   1/1 
  Installing       : xxhash-libs-0.8.0-3.amzn2023.0.2.x86_64                                                                                                                           1/2 
  Installing       : rsync-3.2.6-1.amzn2023.0.3.x86_64                                                                                                                                 2/2 
  Running scriptlet: rsync-3.2.6-1.amzn2023.0.3.x86_64                                                                                                                                 2/2 
  Verifying        : rsync-3.2.6-1.amzn2023.0.3.x86_64                                                                                                                                 1/2 
  Verifying        : xxhash-libs-0.8.0-3.amzn2023.0.2.x86_64                                                                                                                           2/2 

Installed:
  rsync-3.2.6-1.amzn2023.0.3.x86_64                                                         xxhash-libs-0.8.0-3.amzn2023.0.2.x86_64                                                        

Complete!

### on the node, check sfdisk/fdisk already installed or not
sh-5.2$ fdisk -v
fdisk from util-linux 2.37.4
sh-5.2$ 
