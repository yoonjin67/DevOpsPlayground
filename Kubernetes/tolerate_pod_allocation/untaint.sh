#!/bin/bash
kubectl taint nodes $1 node-role.kubernetes.io/control-plane:NoSchedule-
