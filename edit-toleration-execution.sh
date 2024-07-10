[cloudshell-user@ip-10-138-161-186 ~]$ ./edit-toleration.py -h
usage: edit-toleration.py [-h] -n NAMESPACE

optional arguments:
  -h, --help            show this help message and exit
  -n NAMESPACE, --namespace NAMESPACE
                        Namespace for pods to work on. Use `all` if you want to work on all pods.

[cloudshell-user@ip-10-138-161-186 ~]$ kubectl get po
NAME                                                              READY   STATUS    RESTARTS   AGE
free5gc-sigit-testing-free5gc-amf-amf-8656558998-qklgw            1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-ausf-ausf-7c4c4f5998-hs67j          1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-dbpython-dbpython-7c87855c94hrdnj   1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-nrf-nrf-84686758fb-2f2f6            1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-nssf-nssf-8597f79969-hxhzj          1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-pcf-pcf-56f589bcb8-j449q            1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-smf-smf-6ff8c788d7-xrwdn            1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-udm-udm-6854c5cc87-svx2z            1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-udr-udr-5964d86d68-6khhs            1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-upf-upf-559c8f8f8b-mc28q            1/1     Running   0          4m33s
free5gc-sigit-testing-free5gc-webui-webui-6b758569fc-wqpwg        1/1     Running   0          4m33s
mongodb-0                                                         1/1     Running   0          4m33s

[cloudshell-user@ip-10-138-161-186 ~]$ ./check_pods_unreachable_tolerations.sh 
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s

[cloudshell-user@ip-10-138-161-186 ~]$ ./edit-toleration.py -n free5gc
Getting pods for free5gc namespace
Patching free5gc-sigit-testing-free5gc-amf-amf-8656558998-qklgw pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-ausf-ausf-7c4c4f5998-hs67j pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-dbpython-dbpython-7c87855c94hrdnj pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-nrf-nrf-84686758fb-2f2f6 pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-nssf-nssf-8597f79969-hxhzj pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-pcf-pcf-56f589bcb8-j449q pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-smf-smf-6ff8c788d7-xrwdn pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-udm-udm-6854c5cc87-svx2z pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-udr-udr-5964d86d68-6khhs pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-upf-upf-559c8f8f8b-mc28q pod in free5gc namespace
Patching free5gc-sigit-testing-free5gc-webui-webui-6b758569fc-wqpwg pod in free5gc namespace
Patching mongodb-0 pod in free5gc namespace

[cloudshell-user@ip-10-138-161-186 ~]$ ./check_pods_unreachable_tolerations.sh 
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
[cloudshell-user@ip-10-138-161-186 ~]$ 
