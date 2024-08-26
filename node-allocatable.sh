Admin:~/environment $ kubectl get node ip-10-0-57-154.ec2.internal -o json | jq '.status.allocatable'                                               
{
  "cpu": "191450m",
  "ephemeral-storage": "3418854511484",
  "hugepages-1Gi": "0",
  "hugepages-2Mi": "0",
  "intel.com/sriov_bmn_numa0_port1_vf1": "1",
  "intel.com/sriov_bmn_numa0_port1_vf2": "1",
  "intel.com/sriov_bmn_numa0_port1_vf3": "1",
  "intel.com/sriov_bmn_numa0_port1_vf4": "1",
  "intel.com/sriov_bmn_numa0_port1_vf5": "1",
  "intel.com/sriov_bmn_numa0_port1_vf6": "1",
  "intel.com/sriov_bmn_numa0_port2_vf1": "1",
  "intel.com/sriov_bmn_numa0_port2_vf2": "1",
  "intel.com/sriov_bmn_numa0_port2_vf3": "1",
  "intel.com/sriov_bmn_numa0_port2_vf4": "1",
  "intel.com/sriov_bmn_numa0_port2_vf5": "1",
  "intel.com/sriov_bmn_numa0_port2_vf6": "1",
  "intel.com/sriov_bmn_numa1_port1_vf1": "1",
  "intel.com/sriov_bmn_numa1_port1_vf2": "1",
  "intel.com/sriov_bmn_numa1_port1_vf3": "1",
  "intel.com/sriov_bmn_numa1_port1_vf4": "1",
  "intel.com/sriov_bmn_numa1_port1_vf5": "1",
  "intel.com/sriov_bmn_numa1_port1_vf6": "1",
  "intel.com/sriov_bmn_numa1_port2_vf1": "1",
  "intel.com/sriov_bmn_numa1_port2_vf2": "1",
  "intel.com/sriov_bmn_numa1_port2_vf3": "1",
  "intel.com/sriov_bmn_numa1_port2_vf4": "1",
  "intel.com/sriov_bmn_numa1_port2_vf5": "1",
  "intel.com/sriov_bmn_numa1_port2_vf6": "1",
  "memory": "1047935032Ki",
  "pods": "737"
}


Admin:~/environment $ kubectl get node ip-10-0-62-122.ec2.internal -o json | jq '.status.allocatable'     
{
  "cpu": "191450m",
  "ephemeral-storage": "3418854511484",
  "hugepages-1Gi": "0",
  "hugepages-2Mi": "0",
  "intel.com/sriov_bmn_numa0_port1_vf1": "1",
  "intel.com/sriov_bmn_numa0_port1_vf2": "1",
  "intel.com/sriov_bmn_numa0_port1_vf3": "1",
  "intel.com/sriov_bmn_numa0_port1_vf4": "1",
  "intel.com/sriov_bmn_numa0_port1_vf5": "1",
  "intel.com/sriov_bmn_numa0_port1_vf6": "1",
  "intel.com/sriov_bmn_numa0_port2_vf1": "1",
  "intel.com/sriov_bmn_numa0_port2_vf2": "1",
  "intel.com/sriov_bmn_numa0_port2_vf3": "1",
  "intel.com/sriov_bmn_numa0_port2_vf4": "1",
  "intel.com/sriov_bmn_numa0_port2_vf5": "1",
  "intel.com/sriov_bmn_numa0_port2_vf6": "1",
  "intel.com/sriov_bmn_numa1_port1_vf1": "1",
  "intel.com/sriov_bmn_numa1_port1_vf2": "1",
  "intel.com/sriov_bmn_numa1_port1_vf3": "1",
  "intel.com/sriov_bmn_numa1_port1_vf4": "1",
  "intel.com/sriov_bmn_numa1_port1_vf5": "1",
  "intel.com/sriov_bmn_numa1_port1_vf6": "1",
  "intel.com/sriov_bmn_numa1_port2_vf1": "1",
  "intel.com/sriov_bmn_numa1_port2_vf2": "1",
  "intel.com/sriov_bmn_numa1_port2_vf3": "1",
  "intel.com/sriov_bmn_numa1_port2_vf4": "1",
  "intel.com/sriov_bmn_numa1_port2_vf5": "1",
  "intel.com/sriov_bmn_numa1_port2_vf6": "1",
  "memory": "915814544Ki",
  "pods": "737"
}
Admin:~/environment $ 
