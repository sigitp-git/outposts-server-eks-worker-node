MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: application/node.eks.aws

---
apiVersion: node.eks.aws/v1alpha1
kind: NodeConfig
spec:
  cluster:
    apiServerEndpoint: https://AAAAAAAAA.gr7.us-east-1.eks.amazonaws.com
    certificateAuthority: AAAAAAAAA
    cidr: 10.100.0.0/16
    name: CLUSTER-NAME
  kubelet:
    config:
      maxPods: 17
      clusterDNS:
      - 10.100.0.10
    flags:
    - "--node-labels=eks.amazonaws.com/nodegroup-image=ami-04185d472e722c3a7,eks.amazonaws.com/capacityType=SPOT,eks.amazonaws.com/nodegroup=NODEGROUP-NAME"

--//--
