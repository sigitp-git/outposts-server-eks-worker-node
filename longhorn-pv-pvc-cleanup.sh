## PV cleanup
## https://stackoverflow.com/questions/54629660/kubernetes-how-do-i-delete-pv-in-the-correct-manner
kubectl patch pv <pv_name> -p '{"metadata": {"finalizers": null}}'
kubectl delete pv <pv_name> -n namespace --grace-period=0 --force

## PVC cleanup
kubectl edit pvc {your-pvc-name} -n namespace

## Remove finalizer from pvc configuration.
finalizers:
  -  kubernetes.io/pv-protection
