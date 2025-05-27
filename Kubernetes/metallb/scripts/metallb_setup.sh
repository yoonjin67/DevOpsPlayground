echo "Change strictARP to true; now opening editor"
sleep 1
kubectl edit configmap -n kube-system kube-proxy
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.9/config/manifests/metallb-native.yaml
