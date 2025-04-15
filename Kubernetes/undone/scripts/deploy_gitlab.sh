#!/bin/bash

set -e

NAMESPACE="gitlab"
RELEASE_NAME="gitlab"
DOMAIN="$1"  # Use nip.io for external routing if needed
PASSWORD="$2"
EMAIL="$3"
IP="$4"
if [ "$1" == "" ]
then
    exit 1
elif [ "$2" == "" ]
then
    exit 1
elif [ "$3" == "" ]
then
    exit 1
elif [ "$4" == "" ]
then
    IP="127.0.0.1"
fi

echo "✅ Creating namespace: $NAMESPACE..."
kubectl create ns $NAMESPACE || true

echo "🚀 Adding GitLab Helm repo..."
#helm repo add gitlab https://charts.gitlab.io/
helm repo update

echo "⚙️ Generating config values..."

cat <<EOF > gitlab-values.yaml
global:
  hosts:
    domain: $DOMAIN
    externalIP: "$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')"

  ingress:
    configureCertmanager: false
    annotations: {}
    tls:
      enabled: false

certmanager:
  install: false

nginx-ingress:
  enabled: true
  controller:
    service:
      type: NodePort

postgresql:
  install: true
  auth:
    postgresPassword: $PASSWORD
    password: $PASSWORD 

redis:
  auth:
    enabled: false

global:
  minio:
    enabled: false

gitlab:
  webservice:
    resources:
      limits:
        memory: 512Mi
        cpu: 500m
EOF

echo "📦 Installing GitLab Helm chart..."
helm upgrade --install $RELEASE_NAME gitlab/gitlab \
  --namespace $NAMESPACE \
  -f gitlab-values.yaml \
  --timeout 15m \
  --set global.hosts.domain=$DOMAIN \
  --set global.hosts.externalIP=$IP \
  --set certmanager-issuer.email=$EMAIL

echo "🎉 GitLab install initiated. Checking pods..."
kubectl get pods -n $NAMESPACE

echo "🔑 To get root password later, run:"
echo "kubectl get secret -n $NAMESPACE $RELEASE_NAME-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 -d"

