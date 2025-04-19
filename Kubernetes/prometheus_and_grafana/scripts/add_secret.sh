#!/bin/bash
SECRET="$1"
if [ "$SECRET" = "" ]
then
    exit 1
fi
kubectl create secret tls incus-metrics-tls \
    --cert="$SECRET/metrics.crt" \
    --key="$SECRET/metrics.key"  \
    -n monitoring
