## PV cleanup
kubectl delete pv <pv_name> -n namespace --grace-period=0 --force
kubectl patch pv <pv_name> -p '{"metadata": {"finalizers": null}}'
