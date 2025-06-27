#!/bin/bash
helm install -n kube-system metricbeat elastic/metricbeat -f $(YAML $ELK_PLAYGROUND)/gitlab_netio_metric.yaml

