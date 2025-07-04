#!/bin/bash
export K8S_PLAYGROUND="$HOME/DevOpsPlayground/Kubernetes"
export ANSIBLE_PLAYGROUND="$K8S_PLAYGROUND/ansible"
export BASIC_SETUP="$K8S_PLAYGROUND/basic_setup"
export PROMETHEUS_PLAYGROUND="$K8S_PLAYGROUND/prometheus_and_grafana"
export JENKINS_PLAYGROUND="$K8S_PLAYGROUND/jenkins"
export INVENTORY="$ANSIBLE_PLAYGROUND/inventory"
export GITLAB_PLAYGROUND="$K8S_PLAYGROUND/gitlab"
export ELK_PLAYGROUND="$K8S_PLAYGROUND/elk"

# Usage: SCRIPTS $K8S_PLAYGROUND/basic_init
SCRIPTS() {
	local path="$1"
	echo "$path/scripts"
}

# Usage: ASSETS $K8S_PLAYGROUND/basic_init
ASSETS() {
	local folder="$1"
	echo "$folder/assets"
}

# Usage: YAML $K8S_PLAYGROUND/basic_init
YAML() {
	local folder="$1"
	local assets_path=$(ASSETS "$folder")
	echo "$assets_path/yaml"
}
