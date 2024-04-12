[cloudshell-user@ip-10-132-42-133 ~]$ aws ssm get-parameter --name /aws/service/eks/optimized-ami/1.29/amazon-linux-2023/x86_64/standard/recommended/image_id  --region us-east-1 --query "Parameter.Value" --output text
ami-04185d472e722c3a7
[cloudshell-user@ip-10-140-110-221 ~]$ aws ec2 describe-images --region us-east-1 --image-ids ami-04185d472e722c3a7
{
    "Images": [
        {
            "Architecture": "x86_64",
            "CreationDate": "2024-03-29T23:58:10.000Z",
            "ImageId": "ami-04185d472e722c3a7",
            "ImageLocation": "amazon/amazon-eks-node-al2023-x86_64-standard-1.29-v20240329",
            "ImageType": "machine",
            "Public": true,
            "OwnerId": "602401143452",
            "PlatformDetails": "Linux/UNIX",
            "UsageOperation": "RunInstances",
            "State": "available",
            "BlockDeviceMappings": [
                {
                    "DeviceName": "/dev/xvda",
                    "Ebs": {
                        "DeleteOnTermination": true,
                        "Iops": 3000,
                        "SnapshotId": "snap-076b69bd30321abca",
                        "VolumeSize": 20,
                        "VolumeType": "gp3",
                        "Throughput": 125,
                        "Encrypted": false
                    }
                }
            ],
            "Description": "EKS-optimized Kubernetes node based on Amazon Linux 2023, (k8s: 1.29.0, containerd: *)",
            "EnaSupport": true,
            "Hypervisor": "xen",
            "ImageOwnerAlias": "amazon",
            "Name": "amazon-eks-node-al2023-x86_64-standard-1.29-v20240329",
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SriovNetSupport": "simple",
            "VirtualizationType": "hvm",
            "BootMode": "uefi-preferred",
            "DeprecationTime": "2026-03-29T23:58:10.000Z",
            "ImdsSupport": "v2.0"
        }
    ]
}
[cloudshell-user@ip-10-140-110-221 ~]$ 


[cloudshell-user@ip-10-132-42-133 ~]$ aws ssm get-parameter --name /aws/service/eks/optimized-ami/1.29/amazon-linux-2023/arm64/standard/recommended/image_id  --region us-east-1 --query "Parameter.Value" --output text
ami-077a745fad5063d76
[cloudshell-user@ip-10-140-110-221 ~]$ aws ec2 describe-images --region us-east-1 --image-ids ami-077a745fad5063d76

{
    "Images": [
        {
            "Architecture": "arm64",
            "CreationDate": "2024-03-29T23:58:10.000Z",
            "ImageId": "ami-077a745fad5063d76",
            "ImageLocation": "amazon/amazon-eks-node-al2023-arm64-standard-1.29-v20240329",
            "ImageType": "machine",
            "Public": true,
            "OwnerId": "602401143452",
            "PlatformDetails": "Linux/UNIX",
            "UsageOperation": "RunInstances",
            "State": "available",
            "BlockDeviceMappings": [
                {
                    "DeviceName": "/dev/xvda",
                    "Ebs": {
                        "DeleteOnTermination": true,
                        "Iops": 3000,
                        "SnapshotId": "snap-01d855d27237a1c47",
                        "VolumeSize": 20,
                        "VolumeType": "gp3",
                        "Throughput": 125,
                        "Encrypted": false
                    }
                }
            ],
            "Description": "EKS-optimized Kubernetes node based on Amazon Linux 2023, (k8s: 1.29.0, containerd: *)",
            "EnaSupport": true,
            "Hypervisor": "xen",
            "ImageOwnerAlias": "amazon",
            "Name": "amazon-eks-node-al2023-arm64-standard-1.29-v20240329",
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SriovNetSupport": "simple",
            "VirtualizationType": "hvm",
            "BootMode": "uefi",
            "DeprecationTime": "2026-03-29T23:58:10.000Z",
            "ImdsSupport": "v2.0"
        }
    ]
}
[cloudshell-user@ip-10-140-110-221 ~]$ 
