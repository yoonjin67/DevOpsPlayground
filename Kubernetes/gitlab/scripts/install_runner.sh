#!/bin/bash
helm repo add gitlab https://charts.gitlab.io/
helm repo update
kubectl create ns gitlab
helm upgrade --install --namespace gitlab gitlab-runner gitlab/gitlab-runner -f $(YAML $GITLAB_PLAYGROUND)/runner.yaml
