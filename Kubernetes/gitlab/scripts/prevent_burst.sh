#!/bin/bash
kubectl annotate ingress gitlab-webservice-default \
  -n gitlab \
  nginx.ingress.kubernetes.io/limit-rps="10" \
  nginx.ingress.kubernetes.io/limit-burst-multiplier="3" \
  --overwrite
