#!/bin/bash
echo "elasticsearch pw"
kubectl get secrets --namespace=elk elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
echo ""
echo "kibana pw"
kubectl get secrets --namespace=elk kibana-kibana-es-token -ojsonpath='{.data.token}' | base64 -d
