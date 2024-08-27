[root@ip-10-0-57-154 ~]# cat /var/lib/kubelet/cpu_manager_state
{"policyName":"static","defaultCpuSet":"0,2-95,97-191","entries":{"823ca0b5-ed9e-421a-bfca-76fa078f3195":{"ubuntu-netutils":"96"},"b8292fdc-57b1-4bc4-937b-34cd3dd1bcb8":{"ubuntu-netutils":"1"}},"checksum":4076905443}
[root@ip-10-0-57-154 ~]# 

## cpu manager and topology manager policy for numa alinged sriov pods
Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-57-154.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.cpuManagerPolicy'
static
Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-57-154.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.topologyManagerPolicy'
single-numa-node

Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-62-122.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.cpuManagerPolicy'         
static
Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-62-122.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.topologyManagerPolicy'
single-numa-node

Admin:~/environment $ kubectl get pod mg-pod1-dr1-net1-vlan100 -o jsonpath="{ .status.qosClass }"
Guaranteed
Admin:~/environment $ 
