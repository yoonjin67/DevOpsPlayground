#!/bin/bash
kubectl create ns deploy
helm install jenkins jenkinsci/jenkins -f "$(YAML $JENKINS_PLAYGROUND)/values.yaml" --namespace deploy


