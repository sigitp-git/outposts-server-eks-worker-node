Admin:~/environment $ cat ubuntu-iperf3-dockerfile/Dockerfile 
# iperf3 in a container
#
# Run as Server:
# docker run  -it --rm --name=iperf3-srv -p 5201:5201 networkstatic/iperf3 -s
#
# Run as Client (first get server IP address):
# docker inspect --format "{{ .NetworkSettings.IPAddress }}" iperf3-srv
# docker run  -it --rm networkstatic/iperf3 -c <SERVER_IP>
#
FROM ubuntu:jammy
# install binary and remove cache
RUN apt-get update \
    && apt-get install -y iperf3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose the default iperf3 server port
EXPOSE 5201

# entrypoint allows you to pass your arguments to the container at runtime
# very similar to a binary you would run. For example, in the following
# docker run -it <IMAGE> --help' is like running 'iperf3 --help'
ENTRYPOINT ["iperf3"]
Admin:~/environment $ 


Admin:~/environment/ubuntu-iperf3-dockerfile $ aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 01234567890.dkr.ecr.us-east-1.amazonaws.com

Login Succeeded
Admin:~/environment/ubuntu-iperf3-dockerfile $ ls
Dockerfile

Admin:~/environment/ubuntu-iperf3-dockerfile $ sudo docker buildx build --platform linux/amd64,linux/arm64 -t 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-iperf3 --push .                                                                                                                                                
[+] Building 51.4s (11/11) FINISHED                                                                                                                    docker:default
 => [internal] load build definition from Dockerfile                                                                                                             0.0s
 => => transferring dockerfile: 823B                                                                                                                             0.0s
 => [linux/amd64 internal] load metadata for docker.io/library/ubuntu:jammy                                                                                      1.1s
 => [linux/arm64 internal] load metadata for docker.io/library/ubuntu:jammy                                                                                      1.1s
 => [internal] load .dockerignore                                                                                                                                0.0s
 => => transferring context: 2B                                                                                                                                  0.0s
 => [linux/arm64 1/2] FROM docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                2.5s
 => => resolve docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                            0.0s
 => => sha256:e63ce922f0229bde5aea9f366c46883dcd23747e7d2c541f16665f199dbf98b8 27.36MB / 27.36MB                                                                 0.6s
 => => extracting sha256:e63ce922f0229bde5aea9f366c46883dcd23747e7d2c541f16665f199dbf98b8                                                                        1.8s
 => [linux/amd64 1/2] FROM docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                2.7s
 => => resolve docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                            0.0s
 => => sha256:857cc8cb19c0f475256df4b7709003b77f101215ebf3693118e61aac6a5ea4ff 29.54MB / 29.54MB                                                                 0.6s
 => => extracting sha256:857cc8cb19c0f475256df4b7709003b77f101215ebf3693118e61aac6a5ea4ff                                                                        2.0s
 => [linux/arm64 2/2] RUN apt-get update     && apt-get install -y iperf3     && apt-get clean     && rm -rf /var/lib/apt/lists/*                               43.0s
 => [linux/amd64 2/2] RUN apt-get update     && apt-get install -y iperf3     && apt-get clean     && rm -rf /var/lib/apt/lists/*                                9.7s
 => exporting to image                                                                                                                                           3.7s 
 => => exporting layers                                                                                                                                          0.2s 
 => => exporting manifest sha256:4cba7a64ba03bf58e50ce86145ece542384b25eab85e9ff727ace604bcc9f675                                                                0.0s 
 => => exporting config sha256:2800743618010f03def57f7c6b255ab8dd039f45dfdb215ab3b95191416efff7                                                                  0.0s 
 => => exporting attestation manifest sha256:15386b8015e5fd151e69b597d19249440b41c226f51b57353c1ba9f0349dbb69                                                    0.0s 
 => => exporting manifest sha256:7f6cfe9d7d3d7f0a6eabcaab3d74640c67c95cad6ee7eeec22347ea1237e9c1d                                                                0.0s 
 => => exporting config sha256:275620c22103f343d90a30f4e033b576f6e713454d55857c961a19b530365776                                                                  0.0s 
 => => exporting attestation manifest sha256:b0170aafa91a53aee7a006e7674c6ee67d3417bfe506498a87e7c88f86b95f3d                                                    0.0s 
 => => exporting manifest list sha256:45fcfe04ca4fc73a206e6eed348c84425e4fcc434d1c69942ea6503b097e4a5e                                                           0.0s 
 => => naming to 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-iperf3                                                                           0.0s 
 => => unpacking to 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-iperf3                                                                        0.0s 
 => => pushing layers                                                                                                                                            1.9s 
 => => pushing manifest for 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-iperf3@sha256:45fcfe04ca4fc73a206e6eed348c84425e4fcc434d1c69942ea650  1.5s
 => [auth] sharing credentials for 01234567890.dkr.ecr.us-east-1.amazonaws.com                                                                                  0.0s
 => pushing 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-iperf3 with docker                                                                    0.6s
 => => pushing layer 857cc8cb19c0                                                                                                                                0.5s
 => => pushing layer b1fab7a651a3                                                                                                                                0.5s
 => => pushing layer 1403e9d45596                                                                                                                                0.5s
 => => pushing layer a6d94cdd32d3                                                                                                                                0.5s
 => => pushing layer 24cba0c6140e                                                                                                                                0.5s
 => => pushing layer e63ce922f022                                                                                                                                0.5s

Admin:~/environment/ubuntu-iperf3-dockerfile $  aws ecr list-images --repository-name sigitp-ecr  
{
    "imageIds": [
        {
            "imageDigest": "sha256:15386b8015e5fd151e69b597d19249440b41c226f51b57353c1ba9f0349dbb69"
        },
        {
            "imageDigest": "sha256:ed03671d8f1d1ec5850cbf0f0a9ba37b0dc0d62a86b7a50781781ed99dd22832"
        },
        {
            "imageDigest": "sha256:45fcfe04ca4fc73a206e6eed348c84425e4fcc434d1c69942ea6503b097e4a5e",
            "imageTag": "ubuntu-iperf3"
        },
        {
            "imageDigest": "sha256:7f6cfe9d7d3d7f0a6eabcaab3d74640c67c95cad6ee7eeec22347ea1237e9c1d"
        },
        {
            "imageDigest": "sha256:4cba7a64ba03bf58e50ce86145ece542384b25eab85e9ff727ace604bcc9f675"
        },
        {
            "imageDigest": "sha256:a651b74153a9c5f59f0b0ad8b24a245f4f71a36160edeaf4825541906d7599e1"
        },
        {
            "imageDigest": "sha256:b0170aafa91a53aee7a006e7674c6ee67d3417bfe506498a87e7c88f86b95f3d"
        },
        {
            "imageDigest": "sha256:a4aac5157716b7f5b1578f43855b5aa4fda56dd08d49e10ce818fa01454c32c4"
        },
        {
            "imageDigest": "sha256:2cdf684f2a3bf7a124d27f619f1484318319739e5677c33758a857cbed0ef8a1",
            "imageTag": "ubuntu-vpp"
        },
        {
            "imageDigest": "sha256:cbcf52d3c9909eaeddd24895dc16fe1d5d8826e0fb06768c9a306bbf4126d339"
        }
    ]
}

==========================================
Admin:~/environment $ cat iperf3-pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: iperf3-pod
spec:
  containers:
  - name: iperf3-container
    image: 291615555612.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-iperf3
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 300000; done;" ]  
Admin:~/environment $ 

==========================================
Admin:~/environment $ cat iperf3-pod2.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: iperf3-pod2
spec:
  containers:
  - name: iperf3-container
    image: 291615555612.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-iperf3
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 300000; done;" ]  
Admin:~/environment $ 

==========================================
Admin:~/environment $ kubectl get po -o wide
NAME                                READY   STATUS    RESTARTS       AGE     IP               NODE                             NOMINATED NODE   READINESS GATES
iperf3-pod                          1/1     Running   0              9m44s   172.31.148.220   ip-172-31-152-24.ec2.internal    <none>           <none>
iperf3-pod2                         1/1     Running   0              6m36s   172.31.150.90    ip-172-31-148-193.ec2.internal   <none>           <none>
Admin:~/environment $ 


==========================================
SERVER-SHELL [iperf3-pod: 172.31.148.220]:
root@iperf3-pod:/# iperf3 -s -p 5201
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------

==========================================
CLIENT-SHELL [iperf3-pod2: 172.31.150.90]:
root@iperf3-pod2:/# iperf3 -c 172.31.148.220 -p 5201
Connecting to host 172.31.148.220, port 5201
[  5] local 172.31.150.90 port 55976 connected to 172.31.148.220 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   1.00-2.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   2.00-3.00   sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
[  5]   3.00-4.00   sec   591 MBytes  4.96 Gbits/sec    4   3.16 MBytes       
[  5]   4.00-5.00   sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
[  5]   5.00-6.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   6.00-7.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   7.00-8.00   sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
[  5]   8.00-9.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   9.00-10.00  sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  5.78 GBytes  4.96 Gbits/sec    4             sender
[  5]   0.00-10.04  sec  5.78 GBytes  4.94 Gbits/sec                  receiver

iperf Done.

root@iperf3-pod2:/# iperf3 -R -c 172.31.148.220 -p 5201                                                                                                               
Connecting to host 172.31.148.220, port 5201
Reverse mode, remote host 172.31.148.220 is sending
[  5] local 172.31.150.90 port 59256 connected to 172.31.148.220 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   593 MBytes  4.97 Gbits/sec                  
[  5]   1.00-2.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   2.00-3.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   3.00-4.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   4.00-5.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   5.00-6.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   6.00-7.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   7.00-8.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   8.00-9.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   9.00-10.00  sec   592 MBytes  4.96 Gbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.04  sec  5.78 GBytes  4.95 Gbits/sec    1             sender
[  5]   0.00-10.00  sec  5.78 GBytes  4.97 Gbits/sec                  receiver

iperf Done.

root@iperf3-pod2:/# iperf3 --bidir -c 172.31.148.220 -p 5201                                                                                                          
Connecting to host 172.31.148.220, port 5201
[  5] local 172.31.150.90 port 47372 connected to 172.31.148.220 port 5201
[  7] local 172.31.150.90 port 47388 connected to 172.31.148.220 port 5201
[ ID][Role] Interval           Transfer     Bitrate         Retr  Cwnd
[  5][TX-C]   0.00-1.00   sec   596 MBytes  5.00 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   0.00-1.00   sec   592 MBytes  4.97 Gbits/sec                  
[  5][TX-C]   1.00-2.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   1.00-2.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   2.00-3.00   sec   592 MBytes  4.97 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   2.00-3.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   3.00-4.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   3.00-4.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   4.00-5.00   sec   592 MBytes  4.97 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   4.00-5.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   5.00-6.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   5.00-6.00   sec   576 MBytes  4.84 Gbits/sec                  
[  5][TX-C]   6.00-7.00   sec   588 MBytes  4.93 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   6.00-7.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   7.00-8.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   7.00-8.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   8.00-9.00   sec   592 MBytes  4.97 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   8.00-9.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   9.00-10.00  sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   9.00-10.00  sec   592 MBytes  4.96 Gbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID][Role] Interval           Transfer     Bitrate         Retr
[  5][TX-C]   0.00-10.00  sec  5.78 GBytes  4.96 Gbits/sec    0             sender
[  5][TX-C]   0.00-10.04  sec  5.78 GBytes  4.94 Gbits/sec                  receiver
[  7][RX-C]   0.00-10.00  sec  5.77 GBytes  4.95 Gbits/sec  140             sender
[  7][RX-C]   0.00-10.04  sec  5.76 GBytes  4.93 Gbits/sec                  receiver

iperf Done.

root@iperf3-pod2:/# iperf3 -c 172.31.148.220 -t 60 -P 32
Connecting to host 172.31.148.220, port 5201
[  5] local 172.31.150.90 port 39056 connected to 172.31.148.220 port 5201
[  7] local 172.31.150.90 port 39058 connected to 172.31.148.220 port 5201
[  9] local 172.31.150.90 port 39074 connected to 172.31.148.220 port 5201
[ 11] local 172.31.150.90 port 39088 connected to 172.31.148.220 port 5201
[ 13] local 172.31.150.90 port 39102 connected to 172.31.148.220 port 5201
[ 15] local 172.31.150.90 port 39110 connected to 172.31.148.220 port 5201
[ 17] local 172.31.150.90 port 39126 connected to 172.31.148.220 port 5201
[ 19] local 172.31.150.90 port 39142 connected to 172.31.148.220 port 5201
[ 21] local 172.31.150.90 port 39154 connected to 172.31.148.220 port 5201
[ 23] local 172.31.150.90 port 39156 connected to 172.31.148.220 port 5201
[ 25] local 172.31.150.90 port 39172 connected to 172.31.148.220 port 5201
[ 27] local 172.31.150.90 port 39184 connected to 172.31.148.220 port 5201
[ 29] local 172.31.150.90 port 39186 connected to 172.31.148.220 port 5201
[ 31] local 172.31.150.90 port 39190 connected to 172.31.148.220 port 5201
[ 33] local 172.31.150.90 port 39198 connected to 172.31.148.220 port 5201
[ 35] local 172.31.150.90 port 39214 connected to 172.31.148.220 port 5201
[ 37] local 172.31.150.90 port 39226 connected to 172.31.148.220 port 5201
[ 39] local 172.31.150.90 port 39232 connected to 172.31.148.220 port 5201
[ 41] local 172.31.150.90 port 39236 connected to 172.31.148.220 port 5201
[ 43] local 172.31.150.90 port 39244 connected to 172.31.148.220 port 5201
[ 45] local 172.31.150.90 port 39260 connected to 172.31.148.220 port 5201
[ 47] local 172.31.150.90 port 39276 connected to 172.31.148.220 port 5201
[ 49] local 172.31.150.90 port 39282 connected to 172.31.148.220 port 5201
[ 51] local 172.31.150.90 port 39286 connected to 172.31.148.220 port 5201
[ 53] local 172.31.150.90 port 39292 connected to 172.31.148.220 port 5201
[ 55] local 172.31.150.90 port 39296 connected to 172.31.148.220 port 5201
[ 57] local 172.31.150.90 port 39308 connected to 172.31.148.220 port 5201
[ 59] local 172.31.150.90 port 39316 connected to 172.31.148.220 port 5201
[ 61] local 172.31.150.90 port 39320 connected to 172.31.148.220 port 5201
[ 63] local 172.31.150.90 port 39328 connected to 172.31.148.220 port 5201
[ 65] local 172.31.150.90 port 39342 connected to 172.31.148.220 port 5201
[ 67] local 172.31.150.90 port 39344 connected to 172.31.148.220 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  22.0 MBytes   185 Mbits/sec   18    184 KBytes       
[  7]   0.00-1.00   sec  42.0 MBytes   352 Mbits/sec   10    472 KBytes       
[  9]   0.00-1.00   sec  48.0 MBytes   403 Mbits/sec   15    376 KBytes       
[ 11]   0.00-1.00   sec  26.0 MBytes   218 Mbits/sec   12    332 KBytes       
[ 13]   0.00-1.00   sec  87.1 MBytes   730 Mbits/sec   33    306 KBytes       
[ 15]   0.00-1.00   sec  56.6 MBytes   475 Mbits/sec   22    288 KBytes       
[ 17]   0.00-1.00   sec  44.7 MBytes   375 Mbits/sec   23    280 KBytes       
[ 19]   0.00-1.00   sec  38.8 MBytes   326 Mbits/sec   16    175 KBytes       
[ 21]   0.00-1.00   sec  22.3 MBytes   187 Mbits/sec    7    332 KBytes       
[ 23]   0.00-1.00   sec  99.2 MBytes   832 Mbits/sec   65    542 KBytes       
[ 25]   0.00-1.00   sec  38.2 MBytes   320 Mbits/sec   18    218 KBytes       
[ 27]   0.00-1.00   sec   105 MBytes   879 Mbits/sec   54    297 KBytes       
[ 29]   0.00-1.00   sec  31.6 MBytes   265 Mbits/sec   12    297 KBytes       
[ 31]   0.00-1.00   sec  28.3 MBytes   238 Mbits/sec    4    463 KBytes       
[ 33]   0.00-1.00   sec  22.3 MBytes   187 Mbits/sec   11    280 KBytes       
[ 35]   0.00-1.00   sec  38.6 MBytes   324 Mbits/sec   11    411 KBytes       
[ 37]   0.00-1.00   sec  33.0 MBytes   277 Mbits/sec    6    393 KBytes       
[ 39]   0.00-1.00   sec  52.4 MBytes   439 Mbits/sec   30    306 KBytes       
[ 41]   0.00-1.00   sec  22.6 MBytes   190 Mbits/sec   10    201 KBytes       
[ 43]   0.00-1.00   sec  19.3 MBytes   162 Mbits/sec   10    280 KBytes       
[ 45]   0.00-1.00   sec  59.8 MBytes   501 Mbits/sec   12    385 KBytes       
[ 47]   0.00-1.00   sec  20.7 MBytes   173 Mbits/sec   10    332 KBytes       
[ 49]   0.00-1.00   sec  91.6 MBytes   768 Mbits/sec   36    332 KBytes       
[ 51]   0.00-1.00   sec   189 MBytes  1.59 Gbits/sec  129    350 KBytes       
[ 53]   0.00-1.00   sec  45.5 MBytes   381 Mbits/sec   20    341 KBytes       
[ 55]   0.00-1.00   sec  26.8 MBytes   225 Mbits/sec    3    498 KBytes       
[ 57]   0.00-1.00   sec  30.0 MBytes   252 Mbits/sec    5    315 KBytes       
[ 59]   0.00-1.00   sec  28.9 MBytes   243 Mbits/sec   21    376 KBytes       
[ 61]   0.00-1.00   sec  23.5 MBytes   197 Mbits/sec   18    184 KBytes       
[ 63]   0.00-1.00   sec  35.7 MBytes   300 Mbits/sec   13    245 KBytes       
[ 65]   0.00-1.00   sec  64.5 MBytes   541 Mbits/sec   15    542 KBytes       
[ 67]   0.00-1.00   sec  43.7 MBytes   367 Mbits/sec   15    271 KBytes       
[SUM]   0.00-1.00   sec  1.50 GBytes  12.9 Gbits/sec  684     

- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-60.00  sec  2.28 GBytes   326 Mbits/sec  676             sender
[  5]   0.00-60.05  sec  2.27 GBytes   325 Mbits/sec                  receiver
[  7]   0.00-60.00  sec  2.02 GBytes   289 Mbits/sec  795             sender
[  7]   0.00-60.05  sec  2.02 GBytes   289 Mbits/sec                  receiver
[  9]   0.00-60.00  sec  1.83 GBytes   262 Mbits/sec  586             sender
[  9]   0.00-60.05  sec  1.83 GBytes   262 Mbits/sec                  receiver
[ 11]   0.00-60.00  sec  2.24 GBytes   321 Mbits/sec  693             sender
[ 11]   0.00-60.05  sec  2.24 GBytes   320 Mbits/sec                  receiver
[ 13]   0.00-60.00  sec  2.19 GBytes   313 Mbits/sec  683             sender
[ 13]   0.00-60.05  sec  2.18 GBytes   312 Mbits/sec                  receiver
[ 15]   0.00-60.00  sec  3.67 GBytes   525 Mbits/sec  1225             sender
[ 15]   0.00-60.05  sec  3.67 GBytes   525 Mbits/sec                  receiver
[ 17]   0.00-60.00  sec  3.65 GBytes   522 Mbits/sec  1303             sender
[ 17]   0.00-60.05  sec  3.64 GBytes   521 Mbits/sec                  receiver
[ 19]   0.00-60.00  sec  1.66 GBytes   238 Mbits/sec  616             sender
[ 19]   0.00-60.05  sec  1.66 GBytes   238 Mbits/sec                  receiver
[ 21]   0.00-60.00  sec  3.67 GBytes   525 Mbits/sec  1253             sender
[ 21]   0.00-60.05  sec  3.66 GBytes   524 Mbits/sec                  receiver
[ 23]   0.00-60.00  sec  1.79 GBytes   256 Mbits/sec  603             sender
[ 23]   0.00-60.05  sec  1.78 GBytes   255 Mbits/sec                  receiver
[ 25]   0.00-60.00  sec  1.76 GBytes   252 Mbits/sec  573             sender
[ 25]   0.00-60.05  sec  1.76 GBytes   251 Mbits/sec                  receiver
[ 27]   0.00-60.00  sec  1.69 GBytes   242 Mbits/sec  583             sender
[ 27]   0.00-60.05  sec  1.69 GBytes   242 Mbits/sec                  receiver
[ 29]   0.00-60.00  sec  1.81 GBytes   259 Mbits/sec  620             sender
[ 29]   0.00-60.05  sec  1.81 GBytes   259 Mbits/sec                  receiver
[ 31]   0.00-60.00  sec  1.73 GBytes   248 Mbits/sec  647             sender
[ 31]   0.00-60.05  sec  1.73 GBytes   248 Mbits/sec                  receiver
[ 33]   0.00-60.00  sec  3.67 GBytes   525 Mbits/sec  1223             sender
[ 33]   0.00-60.05  sec  3.66 GBytes   524 Mbits/sec                  receiver
[ 35]   0.00-60.00  sec  2.16 GBytes   310 Mbits/sec  699             sender
[ 35]   0.00-60.05  sec  2.16 GBytes   309 Mbits/sec                  receiver
[ 37]   0.00-60.00  sec  2.32 GBytes   332 Mbits/sec  655             sender
[ 37]   0.00-60.05  sec  2.32 GBytes   332 Mbits/sec                  receiver
[ 39]   0.00-60.00  sec  2.13 GBytes   305 Mbits/sec  790             sender
[ 39]   0.00-60.05  sec  2.13 GBytes   305 Mbits/sec                  receiver
[ 41]   0.00-60.00  sec  1.81 GBytes   258 Mbits/sec  589             sender
[ 41]   0.00-60.05  sec  1.80 GBytes   258 Mbits/sec                  receiver
[ 43]   0.00-60.00  sec  10.9 GBytes  1.56 Gbits/sec  4177             sender
[ 43]   0.00-60.05  sec  10.9 GBytes  1.56 Gbits/sec                  receiver
[ 45]   0.00-60.00  sec  3.57 GBytes   511 Mbits/sec  1316             sender
[ 45]   0.00-60.05  sec  3.57 GBytes   510 Mbits/sec                  receiver
[ 47]   0.00-60.00  sec  3.66 GBytes   523 Mbits/sec  1343             sender
[ 47]   0.00-60.05  sec  3.66 GBytes   523 Mbits/sec                  receiver
[ 49]   0.00-60.00  sec  3.59 GBytes   515 Mbits/sec  1313             sender
[ 49]   0.00-60.05  sec  3.59 GBytes   514 Mbits/sec                  receiver
[ 51]   0.00-60.00  sec  1.74 GBytes   249 Mbits/sec  566             sender
[ 51]   0.00-60.05  sec  1.74 GBytes   249 Mbits/sec                  receiver
[ 53]   0.00-60.00  sec  1.77 GBytes   253 Mbits/sec  557             sender
[ 53]   0.00-60.05  sec  1.77 GBytes   253 Mbits/sec                  receiver
[ 55]   0.00-60.00  sec  3.66 GBytes   524 Mbits/sec  1212             sender
[ 55]   0.00-60.05  sec  3.66 GBytes   524 Mbits/sec                  receiver
[ 57]   0.00-60.00  sec  1.96 GBytes   281 Mbits/sec  622             sender
[ 57]   0.00-60.05  sec  1.96 GBytes   280 Mbits/sec                  receiver
[ 59]   0.00-60.00  sec  3.64 GBytes   521 Mbits/sec  1327             sender
[ 59]   0.00-60.05  sec  3.64 GBytes   521 Mbits/sec                  receiver
[ 61]   0.00-60.00  sec  2.15 GBytes   308 Mbits/sec  677             sender
[ 61]   0.00-60.05  sec  2.15 GBytes   308 Mbits/sec                  receiver
[ 63]   0.00-60.00  sec  1.74 GBytes   249 Mbits/sec  555             sender
[ 63]   0.00-60.05  sec  1.74 GBytes   249 Mbits/sec                  receiver
[ 65]   0.00-60.00  sec  2.14 GBytes   307 Mbits/sec  784             sender
[ 65]   0.00-60.05  sec  2.14 GBytes   306 Mbits/sec                  receiver
[ 67]   0.00-60.00  sec  2.13 GBytes   306 Mbits/sec  785             sender
[ 67]   0.00-60.05  sec  2.13 GBytes   305 Mbits/sec                  receiver
[SUM]   0.00-60.00  sec  86.7 GBytes  12.4 Gbits/sec  30046             sender
[SUM]   0.00-60.05  sec  86.7 GBytes  12.4 Gbits/sec                  receiver

iperf Done.
root@iperf3-pod2:/# 
