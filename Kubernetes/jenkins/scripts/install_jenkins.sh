#!/bin/bash
kubectl create ns deploy
helm install jenkins jenkinsci/jenkins -f values.yaml --namespace deploy


