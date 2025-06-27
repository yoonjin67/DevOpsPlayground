#!/bin/bash
helm repo add elastic https://helm.elastic.co
helm repo update
helm upgrade --install elasticsearch-master elastic/elasticsearch -n elk --create-namespace

