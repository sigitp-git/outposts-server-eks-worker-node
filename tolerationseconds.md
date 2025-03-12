This request has to do with being able to withstand extended networking loss between region and the Outpost. 
Without these changes, we can expect PODs (different behaviors for StatefulSets vs Deployments) to get restarted as part of connection recovery between the worker node and the EKS control plane if the disconnect last 5+min.
 
Details on the suggested changes can be found here: https://docs.aws.amazon.com/eks/latest/best-practices/hybrid-nodes-network-disconnection-best-practices.html#_tune_kubernetes_pod_failover_behavior
We are basically looking to add Toleration to the PODs which would allow for PODs to remain stable during and after disconnect events.
 
      tolerations:
      - key: "node.kubernetes.io/unreachable"
        operator: "Exists"
        effect: "NoExecute"
        tolerationSeconds: 1800
 
The seconds duration should be configurable or very long (e.g. 72 hours).
More details can be found here: https://docs.aws.amazon.com/eks/latest/best-practices/hybrid-nodes-kubernetes-pod-failover.html
