[cloudshell-user@ip-10-140-122-60 ~]$ aws iam create-instance-profile --instance-profile-name AmazonEKSNodeInstanceProfile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "AmazonEKSNodeInstanceProfile",
        "InstanceProfileId": "ADFASDFASDFASDFASDF",
        "Arn": "arn:aws:iam::7777777777:instance-profile/AmazonEKSNodeInstanceProfile",
        "CreateDate": "2024-03-16T01:36:54+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --instance-profile-name AmazonEKSNodeInstanceProfile --role-name AmazonEKSNodeRole

[cloudshell-user@ip-10-140-122-60 ~]$ aws iam list-instance-profiles
{
    "InstanceProfiles": [
        {
            "Path": "/",
            "InstanceProfileName": "AmazonEKSNodeInstanceProfile",
                                },
                                "Action": "sts:AssumeRole"
                            }
                        ]
                    }
                }
            ]
        },
        {
            "Path": "/",
            "InstanceProfileName": "AmazonEKSNodeRole",
            "InstanceProfileId": "ADFASDFASDFASDFASDF",
            "Arn": "arn:aws:iam::7777777777:instance-profile/AmazonEKSNodeRole",
            "CreateDate": "2024-03-04T20:08:54+00:00",
            "Roles": [
                {
                    "Path": "/",
                    "RoleName": "AmazonEKSNodeRole",
                    "RoleId": "AROAUHZNEIAOLHJ5MD3E6",
                    "Arn": "arn:aws:iam::7777777777:role/AmazonEKSNodeRole",
                    "CreateDate": "2024-03-04T20:08:54+00:00",
                    "AssumeRolePolicyDocument": {
                        "Version": "2012-10-17",
                        "Statement": [
                            {
                                "Effect": "Allow",
                                "Principal": {
                                    "Service": "ec2.amazonaws.com"
                                },
                                "Action": "sts:AssumeRole"
                            }
                        ]
                    }
                }
            ]
        }
    ]
}
[cloudshell-user@ip-10-140-122-60 ~]$ 
