#!/bin/bash
sudo kubeadm token create --print-join-command
echo "for control plane"
echo `sudo kubeadm token create --print-join-command --certificate-key $(sudo kubeadm init phase upload-certs --upload-certs | sed -n '3p')` --control-plane
