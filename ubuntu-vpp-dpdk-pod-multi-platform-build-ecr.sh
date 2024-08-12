### Ubuntu VPP DPDK Pod Example, Multi Platform ARM64 and AMD64, using Cloud9 Ubuntu Server 22.04 LTS
## Note: qemu, qemu-user-static, and binfmt-support packages are not available yet for AL2023 Cloud9 host

Admin:~/environment $ mkdir ubuntu-vpp-pod
Admin:~/environment $ cd ubuntu-vpp-pod/
Admin:~/environment/ubuntu-vpp-pod $ vim Dockerfile
Admin:~/environment/ubuntu-vpp-pod $ cat Dockerfile 
FROM ubuntu:jammy
 RUN apt-get update && apt-get install -y curl vim iproute2
 RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash
 RUN apt-get update
 RUN apt-get install -y vpp vpp-plugin-core vpp-plugin-dpdk
 WORKDIR /src
 COPY . .
Admin:~/environment/ubuntu-vpp-pod $ 

------------------------------------------------------------
Admin:~/environment/ubuntu-vpp-pod $ aws ecr get-login-password --region us-east-1                                                                                                                                                                         
WKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWKWK
Admin:~/environment/ubuntu-vpp-pod $

Admin:~/environment/ubuntu-vpp-pod $ aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 1234567890.dkr.ecr.us-east-1.amazonaws.com
Login Succeeded
Admin:~/environment/ubuntu-vpp-pod $
------------------------------------------------------------

## Multi-platform build not enabled yet
Admin:~/environment/ubuntu-vpp-pod $ sudo docker buildx build --platform linux/amd64,linux/arm64 -t 1234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-vpp --push .
[+] Building 0.0s (0/0)                                                                                                                                                                                                                      docker:default
ERROR: Multi-platform build is not supported for the docker driver.
Switch to a different driver, or turn on the containerd image store, and try again.
Learn more at https://docs.docker.com/go/build-multi-platform/
Admin:~/environment/ubuntu-vpp-pod $ 

Admin:~/environment/ubuntu-vpp-pod $ docker info -f '{{ .DriverStatus }}'
[[Backing Filesystem xfs] [Supports d_type true] [Using metacopy false] [Native Overlay Diff true] [userxattr false]]
Admin:~/environment/ubuntu-vpp-pod $ 

## Required to build multi-platform build, enabling containerd image store
## https://docs.docker.com/desktop/containerd/
## https://docs.docker.com/storage/containerd/
Admin:/etc/docker $ cat /etc/docker/daemon.json 
{
  "features": {
    "containerd-snapshotter": true
  }
}
Admin:/etc/docker $ 

Admin:/etc/docker $ sudo systemctl restart docker
Admin:/etc/docker $ docker info -f '{{ .DriverStatus }}'
[[driver-type io.containerd.snapshotter.v1]]

------------------------------------------------------------
## if DNS configuration required (optional)
Admin:~/environment/ubuntu-vpp-pod $ cat /etc/docker/daemon.json 
{
  "features": {
    "containerd-snapshotter": true
  },
  "dns": ["172.31.0.2", "8.8.8.8"]
}
Admin:~/environment/ubuntu-vpp-pod $
##Note: DNS from NSLOOKUP

Admin:/etc/docker $ sudo systemctl restart docker                                 
 
------------------------------------------------------------
## Required to build multi-platform build, enabling containerd image store
## qemu, qemu-user-static, and binfmt-support packages need to be installed on the Cloud9 host
## The above packages are not yet available on AL2023 Cloud9 host
Admin:~/environment $ docker buildx ls
NAME/NODE     DRIVER/ENDPOINT   STATUS    BUILDKIT   PLATFORMS
default*      docker                                 
 \_ default    \_ default       running   v0.15.0    linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/amd64/v4

Admin:~/environment $ sudo apt-get update
Admin:~/environment $ sudo apt-get install -y qemu qemu-user-static binfmt-support
Admin:~/environment $ docker buildx ls
NAME/NODE     DRIVER/ENDPOINT   STATUS    BUILDKIT   PLATFORMS
default*      docker                                 
 \_ default    \_ default       running   v0.15.0    linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/amd64/v4, linux/arm64, linux/riscv64, linux/ppc64, linux/ppc64le, linux/s390x, linux/mips64le, linux/mips64, linux/arm/v7, linux/arm/v6
Admin:~/environment $ 
 
------------------------------------------------------------
Admin:~/environment $ sudo docker buildx build --platform linux/amd64,linux/arm64 -t 1234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-vpp --push .
[+] Building 283.5s (22/22) FINISHED                                                                                                                                                                                                         docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                   0.0s
 => => transferring dockerfile: 307B                                                                                                                                                                                                                   0.0s
 => [linux/arm64 internal] load metadata for docker.io/library/ubuntu:jammy                                                                                                                                                                            0.1s
 => [linux/amd64 internal] load metadata for docker.io/library/ubuntu:jammy                                                                                                                                                                            0.1s
 => [internal] load .dockerignore                                                                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                                                                        0.0s
 => [internal] load build context                                                                                                                                                                                                                      0.0s
 => => transferring context: 614B                                                                                                                                                                                                                      0.0s
 => CACHED [linux/arm64 1/7] FROM docker.io/library/ubuntu:jammy@sha256:340d9b015b194dc6e2a13938944e0d016e57b9679963fdeb9ce021daac430221                                                                                                               0.0s
 => => resolve docker.io/library/ubuntu:jammy@sha256:340d9b015b194dc6e2a13938944e0d016e57b9679963fdeb9ce021daac430221                                                                                                                                  0.0s
 => CACHED [linux/amd64 1/7] FROM docker.io/library/ubuntu:jammy@sha256:340d9b015b194dc6e2a13938944e0d016e57b9679963fdeb9ce021daac430221                                                                                                               0.0s
 => => resolve docker.io/library/ubuntu:jammy@sha256:340d9b015b194dc6e2a13938944e0d016e57b9679963fdeb9ce021daac430221                                                                                                                                  0.0s
 => [linux/amd64 2/7] RUN apt-get update && apt-get install -y curl vim iproute2                                                                                                                                                                      14.8s
 => [linux/arm64 2/7] RUN apt-get update && apt-get install -y curl vim iproute2                                                                                                                                                                     141.2s
 => [linux/amd64 3/7] RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash                                                                                                                                      13.7s
 => [linux/amd64 4/7] RUN apt-get update                                                                                                                                                                                                               2.8s
 => [linux/amd64 5/7] RUN apt-get install -y vpp vpp-plugin-core vpp-plugin-dpdk                                                                                                                                                                       5.6s
 => [linux/amd64 6/7] WORKDIR /src                                                                                                                                                                                                                     0.0s
 => [linux/amd64 7/7] COPY . .                                                                                                                                                                                                                         0.1s
 => [linux/arm64 3/7] RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash                                                                                                                                      77.7s 
 => [linux/arm64 4/7] RUN apt-get update                                                                                                                                                                                                              18.4s 
 => [linux/arm64 5/7] RUN apt-get install -y vpp vpp-plugin-core vpp-plugin-dpdk                                                                                                                                                                      21.8s 
 => [linux/arm64 6/7] WORKDIR /src                                                                                                                                                                                                                     0.0s 
 => [linux/arm64 7/7] COPY . .                                                                                                                                                                                                                         0.1s 
 => exporting to image                                                                                                                                                                                                                                23.0s 
 => => exporting layers                                                                                                                                                                                                                               14.7s 
 => => exporting manifest sha256:0dce0f35d3d05acd7937d735073112edcff7205eaf3c6ac32d976da6f9fe78ba                                                                                                                                                      0.0s 
 => => exporting config sha256:ac8ceb3232d99384ff71a872ceaa215fd8f5f7add9aed11f00f44e92ba8aa6ad                                                                                                                                                        0.0s 
 => => exporting attestation manifest sha256:216fa36af79b303765478be41801fdc81fb9b3c8017b9c1b64965c30640237f8                                                                                                                                          0.0s 
 => => exporting manifest sha256:a8a862e1b1e1401833cb521683c3ccd66889875b6bdd5e3b791abcf6663e1172                                                                                                                                                      0.0s
 => => exporting config sha256:c6cc6db29433d4429b21a8aa39fcb398f3f5a5497dd714e6c127f802440ca334                                                                                                                                                        0.0s
 => => exporting attestation manifest sha256:7098ae549ed0ba12022bc04b880b43e9219bc73d1925bbf8d51d1c06d14e6e07                                                                                                                                          0.0s
 => => exporting manifest list sha256:011785d117ade13c648a1d64c10285b8a0213b53f4f02cba16ed11a45ac99998                                                                                                                                                 0.0s
 => => naming to 1234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-vpp                                                                                                                                                                    0.0s
 => => unpacking to 1234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-vpp                                                                                                                                                                 2.5s
 => => pushing layers                                                                                                                                                                                                                                  4.2s
 => => pushing manifest for 1234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-vpp@sha256:011785d117ade13c648a1d64c10285b8a0213b53f4f02cba16ed11a45ac99998                                                                                 1.5s
 => [auth] sharing credentials for 1234567890.dkr.ecr.us-east-1.amazonaws.com                                                                                                                                                                        0.0s
 => pushing 1234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-vpp with docker                                                                                                                                                             0.8s
 => => pushing layer 3713021b0277                                                                                                                                                                                                                      0.7s
 => => pushing layer 4503151f1870                                                                                                                                                                                                                      0.7s
 => => pushing layer 78dfa79cc5ba                                                                                                                                                                                                                      0.7s
 => => pushing layer 4d2dee06dced                                                                                                                                                                                                                      0.7s
 => => pushing layer cbd36d209238                                                                                                                                                                                                                      0.7s
 => => pushing layer 3fcbc345e1bd                                                                                                                                                                                                                      0.7s
 => => pushing layer 4f4fb700ef54                                                                                                                                                                                                                      0.7s
 => => pushing layer b3a9cc4e5f65                                                                                                                                                                                                                      0.7s
 => => pushing layer eea2cdd32e50                                                                                                                                                                                                                      0.7s
 => => pushing layer 13ba5f0b70ae                                                                                                                                                                                                                      0.7s
 => => pushing layer 7f982ab28f07                                                                                                                                                                                                                      0.7s
 => => pushing layer f12f89dbd335                                                                                                                                                                                                                      0.7s
 => => pushing layer 4ce000a43472                                                                                                                                                                                                                      0.7s
 => => pushing layer ba031bac0ccd                                                                                                                                                                                                                      0.7s
Admin:~/environment $ 

------------------------------------------------------------

Admin:~/environment $ aws ecr list-images --repository-name sigitp-ecr                                                                                                                                                                                      
{
    "imageIds": [
        {
            "imageDigest": "sha256:7098ae549ed0ba12022bc04b880b43e9219bc73d1925bbf8d51d1c06d14e6e07"
        },
        {
            "imageDigest": "sha256:0dce0f35d3d05acd7937d735073112edcff7205eaf3c6ac32d976da6f9fe78ba"
        },
        {
            "imageDigest": "sha256:216fa36af79b303765478be41801fdc81fb9b3c8017b9c1b64965c30640237f8"
        },
        {
            "imageDigest": "sha256:a8a862e1b1e1401833cb521683c3ccd66889875b6bdd5e3b791abcf6663e1172"
        },
        {
            "imageDigest": "sha256:011785d117ade13c648a1d64c10285b8a0213b53f4f02cba16ed11a45ac99998",
            "imageTag": "ubuntu-vpp"
        }
    ]
}
Admin:~/environment $ 

### share ECR image to another account
https://repost.aws/knowledge-center/secondary-account-access-ecr
https://www.youtube.com/watch?v=YvqImD7pe9g
