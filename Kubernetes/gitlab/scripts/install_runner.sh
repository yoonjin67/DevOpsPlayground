#!/bin/bash
echo 'Be sure to provide token and url: e,g. ./install_runner.sh https://gitlab.myurl.com glrt-addme'
helm upgrade --install --namespace gitlab  gitlab-runner -f $(YAML $GITLAB_PLAYGROUND)/runner.yaml gitlab/gitlab-runner --set gitlabUrl=$1,runnerRegistrationToken=$2

