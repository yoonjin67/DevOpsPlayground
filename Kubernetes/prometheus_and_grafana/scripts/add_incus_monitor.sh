#!/bin/bash
helm upgrade prometheus prometheus-community/kube-prometheus-stack -n monitoring -f "$(YAML $PROMETHEUS_PLAYGROUND)/values.yaml"
