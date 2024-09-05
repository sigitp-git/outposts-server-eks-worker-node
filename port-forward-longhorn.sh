# port-forward-longhorn-via-worker-node

Admin:~/environment $ kubectl get svc -A
NAMESPACE         NAME                          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE
default           kubernetes                    ClusterIP   10.100.0.1       <none>        443/TCP                  14d
kube-system       kube-dns                      ClusterIP   10.100.0.10      <none>        53/UDP,53/TCP,9153/TCP   14d
longhorn-system   longhorn-admission-webhook    ClusterIP   10.100.223.95    <none>        9502/TCP                 16h
longhorn-system   longhorn-backend              ClusterIP   10.100.243.159   <none>        9500/TCP                 16h
longhorn-system   longhorn-conversion-webhook   ClusterIP   10.100.133.194   <none>        9501/TCP                 16h
longhorn-system   longhorn-engine-manager       ClusterIP   None             <none>        <none>                   16h
longhorn-system   longhorn-frontend             ClusterIP   10.100.139.116   <none>        80/TCP                   16h
longhorn-system   longhorn-recovery-backend     ClusterIP   10.100.237.150   <none>        9503/TCP                 16h
longhorn-system   longhorn-replica-manager      ClusterIP   None             <none>        <none>                   16h

Admin:~/environment $ kubectl describe svc longhorn-frontend -n longhorn-system
Name:              longhorn-frontend
Namespace:         longhorn-system
Labels:            app=longhorn-ui
                   app.kubernetes.io/instance=longhorn
                   app.kubernetes.io/name=longhorn
                   app.kubernetes.io/version=v1.6.2
Annotations:       <none>
Selector:          app=longhorn-ui
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.100.139.116
IPs:               10.100.139.116
Port:              http  80/TCP
TargetPort:        http/TCP
Endpoints:         172.31.151.158:8000,172.31.152.193:8000
Session Affinity:  None
Events:            <none>
Admin:~/environment $ 


# port forward the endpoint IP and port via SSH to worker node
# the SSH is executed from your  local workstation, 
# where SSH destination is the same compute node where it can reach the Endpoints listed above
ssh -i file.pem -L 8000:172.31.151.158:8000 ec2-user@ec2-34-229-218-164.compute-1.amazonaws.com
ssh -i file.pem -L 8000:172.31.152.193:8000 ec2-user@ec2-184-72-87-109.compute-1.amazonaws.com
