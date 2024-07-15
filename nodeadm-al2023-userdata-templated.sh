UserData:
          Fn::Base64: 
            !Sub 
              - |
                MIME-Version: 1.0
                Content-Type: multipart/mixed; boundary="//"

                --//
                Content-Type: application/node.eks.aws

                ---
                apiVersion: node.eks.aws/v1alpha1
                kind: NodeConfig
                spec:
                  cluster:
                    apiServerEndpoint: ${API_SERVER_EP}
                    certificateAuthority: ${CA}
                    cidr: ${VPC_CIDR}
                    name: ${CLUSTER_NAME}
                  kubelet:
                    config:
                      clusterDNS:
                      - ${CLUSTER_DNS}                 
                    flags:
                    - ${KUBELET_ARGS}
                --//
                Content-Type: text/x-shellscript; charset="us-ascii"

                #!/bin/bash
                #... your shell script here (e.g. Longhorn volume mount or Multus)...
                
                --//--
              - CLUSTER_NAME: !Ref ClusterName
                VPC_CIDR: !Ref VpcCidr
                KUBELET_ARGS: !Ref KubeletExtraArguments
                API_SERVER_EP: !Ref EksApiServerEndpoint
                CA: !Ref EksCertificateAuthority
                CLUSTER_DNS: !Ref EksClusterDns
