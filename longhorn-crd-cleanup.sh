for crd in $(kubectl get crd -o jsonpath={.items[*].metadata.name} | tr ' ' '\n' | grep longhorn.io); do
  kubectl patch crd/$crd -p '{"metadata":{"finalizers":[]}}' --type=merge
  kubectl -n ${NAMESPACE} get $crd -o yaml | sed "s/\- longhorn.io//g" | kubectl apply -f -
  kubectl -n ${NAMESPACE} delete $crd --all
  kubectl delete crd/$crd
done
# https://stackoverflow.com/questions/52009124/not-able-to-completely-remove-kubernetes-customresource
# kubectl patch crd/MY_CRD_NAME -p '{"metadata":{"finalizers":[]}}' --type=merge
# https://longhorn.io/docs/1.8.0/deploy/uninstall/#problems-with-crds
