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

## on Cloud9/cloudshell, clone the repo
Admin:~/environment $ git clone https://github.com/aws-samples/backup-outposts-servers-linux-instance.git
Cloning into 'backup-outposts-servers-linux-instance'...
remote: Enumerating objects: 76, done.
remote: Counting objects: 100% (76/76), done.
remote: Compressing objects: 100% (74/74), done.
remote: Total 76 (delta 37), reused 17 (delta 1), pack-reused 0
Receiving objects: 100% (76/76), 41.63 KiB | 3.78 MiB/s, done.
Resolving deltas: 100% (37/37), done.
Admin:~/environment $ 

Admin:~/environment $ cd backup-outposts-servers-linux-instance

Admin:~/environment/backup-outposts-servers-linux-instance (main) $ make documents
Removing ./Output
Making ./Output
python3 ./Setup/create_document.py --document_name "BackupOutpostsServerLinuxInstanceToEBS.json" > ./Output/"BackupOutpostsServerLinuxInstanceToEBS.json"
Done making documents
Admin:~/environment/backup-outposts-servers-linux-instance (main) $ 

## upload the Attachment output to S3
## https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html
Admin:~/environment/backup-outposts-servers-linux-instance (main) $ aws s3 ls
2024-04-26 16:52:17 aws-cloudtrail-logs-291615555612-7732bd30
2024-07-23 02:28:09 aws-quicksetup-patchpolicy-291615555612-w6dy7
2024-07-23 02:27:41 aws-quicksetup-patchpolicy-access-log-291615555612-b407-w6dy7
2024-03-15 23:32:17 cf-templates-1eqq1l1vlu107-us-east-1

Admin:~/environment/backup-outposts-servers-linux-instance (main) $ aws s3 mb s3://ssm-automation-doc
make_bucket: ssm-automation-doc
Admin:~/environment/backup-outposts-servers-linux-instance (main) $ 

Admin:~/environment/backup-outposts-servers-linux-instance (main) $ aws s3 cp Output/Attachments/attachment.zip s3://ssm-automation-doc
upload: Output/Attachments/attachment.zip to s3://ssm-automation-doc/attachment.zip

Admin:~/environment/backup-outposts-servers-linux-instance (main) $ aws s3 ls s3://ssm-automation-doc
2024-08-11 19:31:05      11602 attachment.zip
Admin:~/environment/backup-outposts-servers-linux-instance (main) $ 

Admin:~/environment/backup-outposts-servers-linux-instance (main) $ BUCKET_NAME="ssm-automation-doc"
Admin:~/environment/backup-outposts-servers-linux-instance (main) $ DOC_NAME="BackupOutpostsServerLinuxInstanceToEBS"
Admin:~/environment/backup-outposts-servers-linux-instance (main) $ OUTPOST_REGION="us-east-1"

Admin:~/environment/backup-outposts-servers-linux-instance (main) $ aws ssm create-document --content file://Output/BackupOutpostsServerLinuxInstanceToEBS.json --name ${DOC_NAME} --document-type "Automation" --document-format JSON --attachments Key=S3FileUrl,Values=s3://${BUCKET_NAME}/attachment.zip,Name=attachment.zip --region ${OUTPOST_REGION}
[JSON DOC OUTPUT]

Admin:~/environment/backup-outposts-servers-linux-instance (main) $ aws ssm create-document --content file://Output/BackupOutpostsServerLinuxInstanceToEBS.json --name ${DOC_NAME} --document-type "Automation" --document-format JSON --attachments Key=S3FileUrl,Values=s3://${BUCKET_NAME}/attachment.zip,Name=attachment.zip --region ${OUTPOST_REGION}
An error occurred (DocumentAlreadyExists) when calling the CreateDocument operation: Document with same name BackupOutpostsServerLinuxInstanceToEBS already exists
Admin:~/environment/backup-outposts-servers-linux-instance (main) $ 

## using the document
Usage Instructions
Open the AWS Console and go to Systems Manager > Documents > “Owned by me” in the region where you deployed the SSM Automation
Select the document name you specified when following the "Installation Instructions" and click on “Execute automation”
Fill-in the input parameters and click on "Execute". Familiarize yourself with the document by reading through the parameters and steps description.

## Create Role to Trust AWS Service: SSM to do backup: EC2, S3 (admin)
## Attach that role to the execution of the SSM automation document
## Remember, rsync needs to be installed on the node
## Remember, subnet must NOT be Outposts subnet, but subnet in Region

## Example of successful execution
https://us-east-1.console.aws.amazon.com/systems-manager/automation/execution/fe4576d1-e7f9-4e29-9a67-3ecc06573b32?region=us-east-1

Input parameters
AmiId
SelectAutomatically
AssumeRole
arn:aws:iam::01234567890:role/SSM-Admin-for-Outposts-Server-Backup
Exclusions
-
InstanceId
i-063eb2f1e23588223
MaxThroughput
0
SubnetId
subnet-0304c7c31f6b5a854
TemporaryInstancesType
c5.large
UniqueId
{{ automation:EXECUTION_ID }}

Output:
createAMIFromSnapshot.ImageId
ami-011d8c38ec0f040d6

Executed automation [1 hour]
BackupOutpostsServerLinuxInstanceToEBS
Start time
Sun, 11 Aug 2024 20:24:31 GMT
Execution ID
fe4576d1-e7f9-4e29-9a67-3ecc06573b32
End time
Sun, 11 Aug 2024 21:23:00 GMT
Execution mode
Auto
Runbook version
1

