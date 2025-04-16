#!/bin/bash
export K8S_PLAYGROUND="$HOME/DevOpsPlayground/Kubernetes"
export ANSIBLE_PLAYGROUND="$K8S_PLAYGROUND/ansible"
export BASIC_SETUP="$K8S_PLAYGROUND/basic_setup"
export INVENTORY="$ANSIBLE_PLAYGROUND/inventory"

# Usage: SCRIPTS $K8S_PLAYGROUND/basic_init
SCRIPTS() {
	local path="$1"
	local folder=$(dirname "$path")
	echo "$folder/scripts"
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
