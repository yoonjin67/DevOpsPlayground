#!/bin/bash
kubectl create ns monitoring
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring 

