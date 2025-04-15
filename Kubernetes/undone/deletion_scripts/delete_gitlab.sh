#!/bin/bash

# 네임스페이스 설정 (기본 네임스페이스인 경우 'default')
NAMESPACE="gitlab"

# GitLab 관련 Pod 삭제
echo "Deleting all gitlab-related pods in namespace $NAMESPACE..."
kubectl get pods -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force pod -n $NAMESPACE

# GitLab 관련 Deployment 삭제
echo "Deleting all gitlab-related deployments in namespace $NAMESPACE..."
kubectl get deployments -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force deployment -n $NAMESPACE

# GitLab 관련 StatefulSet 삭제
echo "Deleting all gitlab-related statefulsets in namespace $NAMESPACE..."
kubectl get statefulsets -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force statefulset -n $NAMESPACE

# GitLab 관련 ReplicaSet 삭제
echo "Deleting all gitlab-related replicasets in namespace $NAMESPACE..."
kubectl get replicasets -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force replicaset -n $NAMESPACE

# GitLab 관련 Service 삭제
echo "Deleting all gitlab-related services in namespace $NAMESPACE..."
kubectl get services -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force service -n $NAMESPACE

# GitLab 관련 Job 삭제
echo "Deleting all gitlab-related jobs in namespace $NAMESPACE..."
kubectl get jobs -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force job -n $NAMESPACE

# GitLab 관련 Secret 삭제
echo "Deleting all gitlab-related secrets in namespace $NAMESPACE..."
kubectl get secrets -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force secret -n $NAMESPACE

# GitLab 관련 ConfigMap 삭제
echo "Deleting all gitlab-related configmaps in namespace $NAMESPACE..."
kubectl get configmaps -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force configmap -n $NAMESPACE

# GitLab 관련 PVC 삭제
echo "Deleting all gitlab-related persistent volume claims in namespace $NAMESPACE..."
kubectl get pvc -n $NAMESPACE --no-headers | grep 'gitlab' | awk '{print $1}' | xargs kubectl delete --force pvc -n $NAMESPACE

echo "All GitLab-related resources in namespace $NAMESPACE have been deleted."

