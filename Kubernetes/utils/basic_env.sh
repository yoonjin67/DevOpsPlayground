#!/bin/bash
export K8S_PLAYGROUND="$HOME/DevOpsPlayground/Kubernetes"

# Usage: SCRIPTS $K8S_PLAYGROUND/basic_init
SCRIPTS() {
	local folder="$1"
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
