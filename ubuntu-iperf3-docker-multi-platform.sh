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
