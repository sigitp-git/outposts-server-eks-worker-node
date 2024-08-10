# port-forward-longhorn-via-worker-node

kubectl get svc -A
kubectl describe svc longhorn-frontend -n longhorn-system

# port forward the endpoint IP and port via SSH to worker node
ssh -i file.pem -L 8000:172.31.149.220:8000 ec2-user@ec2-184-72-87-109.compute-1.amazonaws.com
ssh -i file.pem -L 8000:172.31.151.158:8000 ec2-user@ec2-34-229-218-164.compute-1.amazonaws.com
