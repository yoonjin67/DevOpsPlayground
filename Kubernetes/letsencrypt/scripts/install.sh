#!/bin/bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
kubectl apply -f $(YAML $GITLAB_PLAYGROUND)/letsencrypt
