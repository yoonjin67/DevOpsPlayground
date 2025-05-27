#!/bin/bash
helm repo add christianhuth https://charts.christianhuth.de
helm repo update
helm install kube-ops-view christianhuth/kube-ops-view -n monitoring
