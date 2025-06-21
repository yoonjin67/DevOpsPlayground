#!/bin/bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
kubectl apply -f $(YAML $GITLAB_PLAYGROUND)/letsencrypt
kubectl annotate ingress gitlab-webservice-default -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
kubectl annotate ingress gitlab-minio -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
kubectl annotate ingress gitlab-kas -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
kubectl annotate ingress gitlab-registry -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
