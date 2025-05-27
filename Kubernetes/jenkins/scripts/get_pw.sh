#!/bin/bash
kubectl exec --namespace deploy -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo

