#!/bin/bash
helm repo add gitlab https://charts.gitlab.io/
helm repo update
kubectl create ns gitlab
helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.hosts.domain=$YOUR_DOMAIN \
  --set global.hosts.externalIP=$YOUR_PUBLIC_IP \
  --set certmanager-issuer.email=$YOUR_EMAIL \
  --set gitlab.gitlab-rails.initialRootEmail=$YOUR_EMAIL \
  -f $(YAML $GITLAB_PLAYGROUND)/values.yaml \
  --namespace gitlab
  --set gitlab-runner.runnerToken=$1
