#!/bin/bash

# Store pod names in an array  
pods=($(kubectl get po -A |
    awk 'NR>1 { printf sep $1; sep=" "}'))
if [ ${#pods[@]} -gt $n ]; then  # $n is still undefined!
    for pod in "${pods[@]}"; do
        kubectl describe pod "$pod" |
        awk -v dt="$(date +"%a, %d %b %Y")" '
            /SecretName:/ { next }
            /Name:/ { name=$NF }
            /Start Time:/ { t=$3 $4 $5 $6;
                if (t==dt) print name
                name="" }'
    done
fi
