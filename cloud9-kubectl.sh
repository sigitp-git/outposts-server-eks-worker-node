### KUBECTL FOR CLOUD9
### ON CLOUD9, SETTINGS, AWS SETTINGS, TURN OFF AWS MANAGED TEMPORARY CREDENTIALS
### ASIDE FROM DEFAULT CLOUD9SSM INSTANCE PROFILE POLICY, ADD EKS RBAC FOR CLOUD9 POLICY [policy-for-eks-rbac.json] 
### Attach a new role to the Cloud9 [kubectl-role-for-cloud9] instance with: https://github.com/sigitp-git/outposts-server-eks-worker-node/blob/main/policy-for-eks-rbac.json
### 1. AWSCloud9SSMInstanceProfile | AWS managed
### 2. policy-for-eks-rbac | Customer managed
### Don't forget to add the security group of the Cloud9 instance (or default SG) to the EKS cluster additional security group (took few minutes after adding to take effect)

[cloudshell-user@ip-10-130-76-69 ~]$ cat aws-auth-cm-addrole.yaml 
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::01234567890:role/AmazonEKSNodeRole
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::01234567890:role/role-eks-instance-profile-for-cloud9
      username: i-0c9fe2ee9234098 ##EC2 instance ID of the Cloud9
      groups:
        - system:masters
[cloudshell-user@ip-10-130-76-69 ~]$ 


### AWS-AUTH
[cloudshell-user@ip-10-140-117-46 ~]$ cat aws-auth-cm-sigitp-eks-gamma.yaml 
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::01234567890:role/AmazonEKSNodeRole
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::01234567890:role/eks-node-group-vfio-multus-dpdk-cf-NodeInstanceRole-aD0cbv3uPexv
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::01234567890:role/role-eks-instance-profile-for-cloud9
      username: i-0c9fe2ee9c90db8c6
      groups:
        - system:masters
[cloudshell-user@ip-10-140-117-46 ~]$ 

