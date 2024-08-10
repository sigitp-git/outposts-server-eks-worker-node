# upload local file to Cloud9, then scp to node via Cloud9 to node

Admin:~/environment $ cat scp 
scp -i "file.pem" ./MLNX_OFED_LINUX-23.10-3.2.2.0-ubuntu22.04-x86_64.tgz ec2-user@ec2-3-90-45-9.compute-1.amazonaws.com:/home/ec2-user
scp -i "file.pem" ./MLNX_OFED_LINUX-23.10-3.2.2.0-rhel9.4-x86_64.tgz ec2-user@ec2-3-90-45-9.compute-1.amazonaws.com:/home/ec2-user
scp -i "file.pem" ./MLNX_OFED_LINUX-23.10-3.2.2.0-ubuntu22.04-x86_64.tgz ubuntu@ec2-3-92-136-60.compute-1.amazonaws.com:/home/ubuntu
scp -i "file.pem" ./kernel-6.1.103-111.183.amzn2023.x86_64.rpm ec2-user@ec2-54-89-252-83.compute-1.amazonaws.com:/home/ec2-user
scp -i "file.pem" ./kernel-6.1.103-111.183.amzn2023.x86_64.rpm ec2-user@ec2-34-229-218-164.compute-1.amazonaws.com:/home/ec2-user
Admin:~/environment $ 
