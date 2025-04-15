#!/bin/bash

# 네임스페이스 설정 (기본 네임스페이스인 경우 'default')
NAMESPACE="default"

# MinIO 관련 Pod 삭제
echo "Deleting all minio-related pods in namespace $NAMESPACE..."
kubectl get pods -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force pod -n $NAMESPACE

# MinIO 관련 Deployment 삭제
echo "Deleting all minio-related deployments in namespace $NAMESPACE..."
kubectl get deployments -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force deployment -n $NAMESPACE

# MinIO 관련 StatefulSet 삭제
echo "Deleting all minio-related statefulsets in namespace $NAMESPACE..."
kubectl get statefulsets -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force statefulset -n $NAMESPACE

# MinIO 관련 ReplicaSet 삭제
echo "Deleting all minio-related replicasets in namespace $NAMESPACE..."
kubectl get replicasets -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force replicaset -n $NAMESPACE

# MinIO 관련 Service 삭제
echo "Deleting all minio-related services in namespace $NAMESPACE..."
kubectl get services -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force service -n $NAMESPACE

# MinIO 관련 Job 삭제
echo "Deleting all minio-related jobs in namespace $NAMESPACE..."
kubectl get jobs -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force job -n $NAMESPACE

# MinIO 관련 Secret 삭제
echo "Deleting all minio-related secrets in namespace $NAMESPACE..."
kubectl get secrets -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force secret -n $NAMESPACE

# MinIO 관련 ConfigMap 삭제
echo "Deleting all minio-related configmaps in namespace $NAMESPACE..."
kubectl get configmaps -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force configmap -n $NAMESPACE

# MinIO 관련 PVC 삭제
echo "Deleting all minio-related persistent volume claims in namespace $NAMESPACE..."
kubectl get pvc -n $NAMESPACE --no-headers | grep 'minio' | awk '{print $1}' | xargs kubectl delete --force pvc -n $NAMESPACE

echo "All MinIO-related resources in namespace $NAMESPACE have been deleted."

