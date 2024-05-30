#!/bin/bash

# Store pod names in an array  
# kubectl config set-context --current --namespace=kube-system
pods=($(kubectl get po |
    awk 'NR>1 { printf sep $1; sep=" "}'))

if [[ ${#pods[@]} -gt $n ]]; then
    for pod in "${pods[@]}"; do
        kubectl describe po "$pod" | grep unreachable
    done
fi
