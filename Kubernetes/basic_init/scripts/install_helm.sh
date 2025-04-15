#!/bin/bash
curl https://get.helm.sh/helm-v3.17.3-linux-amd64.tar.gz > helm.tar.gz
tar xvfz helm.tar.gz
mv linux-amd64/helm /usr/bin/
rm -rf linux-amd64 
#install helm

