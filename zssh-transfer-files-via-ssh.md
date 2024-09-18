## Install ZSSH on Ubuntu
`sudo apt install zssh`

## Install ZSSH on Amazon Linux 2023 (AL2023)


## Install LRZSZ, https://www.ohse.de/uwe/software/lrzsz.html on AL2023
Needs GCC
```
sudo yum groupinstall "Development Tools"
wget https://www.ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz
tar xvf lrzsz-0.12.20.tar.gz
cd lrzsz-0.12.20/
./configure
make
sudo make install
lsz --help
```

## Start ZSSH
```
[localhost]$ zssh -i file.pem ec2-user@remote-ip-address

[remote ~]$ ls
tobetransferredtolocalhost

[remote ~]$ lsz tobetransferredtolocalhost
�*B00000000000000
{on Mac, enter escape sequence: Ctrl+Shift+2}
zssh > {enter rz}

zssh > rz
Receiving: tobetransferredtolocalhost                                              
Bytes received:  185400/ 185400   BPS:238937                

Transfer complete
[remote ~]$ 
```
Transfer to localhost completed
