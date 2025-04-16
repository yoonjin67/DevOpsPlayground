#!/bin/bash
#untaint control plance
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
kubectl get nodes -o wide
