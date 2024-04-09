[cloudshell-user@ip-10-132-42-133 ~]$ aws ssm get-parameter --name /aws/service/eks/optimized-ami/1.29/amazon-linux-2023/x86_64/standard/recommended/image_id  --region us-east-1 --query "Parameter.Value" --output text
ami-04185d472e722c3a7

[cloudshell-user@ip-10-132-42-133 ~]$ aws ssm get-parameter --name /aws/service/eks/optimized-ami/1.29/amazon-linux-2023/arm64/standard/recommended/image_id  --region us-east-1 --query "Parameter.Value" --output text
ami-077a745fad5063d76
