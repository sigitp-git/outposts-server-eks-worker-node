#!/bin/bash

# Store pod names in an array  
pods=($(kubectl get po |
    awk 'NR>1 { printf sep $2; sep=" "}'))

if [[ ${#pods[@]} -gt $n ]]; then
    for pod in "${pods[@]}"; do
        kubectl describe po "$pod" |
        awk -v dt="$(date +"%a, %d %b %Y")" '
            /SecretName:/ { next }
            /Name:/ { name=$NF }
            /Start Time:/ { t=$3 $4 $5 $6;
                if (t==dt) print name
                name="" }'
    done
fi
