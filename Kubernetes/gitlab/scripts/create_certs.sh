#!/bin/bash
openssl s_client -showcerts -connect $YOUR_DOMAIN:443 </dev/null 2>/dev/null | openssl x509 -outform PEM > $YOUR_DOMAIN.crt
kubectl create secret generic gitlab-runner-ca-cert --from-file=ca.crt=gitlab.yoonjin2.kr.crt -n gitlab
