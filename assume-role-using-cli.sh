[ec2-user@ip-172-31-60-107 ~]$ ROLE_OUTPUT=$(aws sts assume-role --role-arn arn:aws:iam::01234567890:role/ELS-IAM-Trust-Role-Kinara --role-session-name assume-role-test)
[ec2-user@ip-172-31-60-107 ~]$ export AWS_ACCESS_KEY_ID=$(echo $ROLE_OUTPUT | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $ROLE_OUTPUT | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $ROLE_OUTPUT | jq -r '.Credentials.SessionToken')
[ec2-user@ip-172-31-60-107 ~]$ aws sts get-caller-identity
{
    "UserId": "AROAUHZNEIAOA4WZUGP4J:chy-test-2",
    "Account": "01234567890",
    "Arn": "arn:aws:sts::01234567890:assumed-role/ELS-IAM-Trust-Role-Kinara/assume-role-test"
}
[ec2-user@ip-172-31-60-107 ~]$ aws eks list-clusters --region us-east-1
{
    "clusters": [
        "cluster1",
        "cluster2",
        "cluster3",
        "cluster4",
        "cluster5"
    ]
}
[ec2-user@ip-172-31-60-107 ~]$
