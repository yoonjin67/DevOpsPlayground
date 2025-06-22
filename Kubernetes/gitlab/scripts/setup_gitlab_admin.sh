#!/bin/bash
kubectl create clusterrolebinding $1 --clusterrole=cluster-admin --group=system:serviceaccounts
