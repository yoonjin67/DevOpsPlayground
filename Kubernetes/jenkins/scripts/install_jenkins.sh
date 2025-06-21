#!/bin/bash
kubectl create ns deploy
helm repo add jenkins https://charts.jenkins.io
helm install jenkins jenkins/jenkins -f "$(YAML $JENKINS_PLAYGROUND)/values.yaml" --namespace deploy


