#!/bin/bash
if [ "$(whoami)" != "root" ]
then
    echo "This script must be run as root"
    exit 1
fi
USER=$1
sysctl -w net.ipv4.ip_forward=1
apt update -y
sudo swapoff -a
sudo sed -i.bak '/\sswap\s/ s/^/# /' /etc/fstab

sudo systemctl enable containerd

apt install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | tee /etc/apt/sources.list.d/kubernetes_v1.32.list
apt update
apt install -y kubelet kubeadm kubectl containerd

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml > /dev/null

sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

sudo systemctl daemon-reexec
sudo systemctl restart containerd

apt-mark hold kubelet kubeadm kubectl
vi /etc/containerd/config.toml
iptables -A INPUT -p tcp --dport 6443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 6443 -j ACCEPT
iptables -A INPUT -p tcp --dport 6379 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 6379 -j ACCEPT
iptables -A INPUT -p tcp --dport 10250 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 10250 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 5001 -j ACCEPT
iptables -A INPUT -p tcp --dport 5001 -j ACCEPT
iptables -A INPUT -p tcp --dport 2379:2380 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 2379:2380 -j ACCEPT
iptables -A INPUT -p tcp --dport 30000:32767 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 30000:32767 -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
netfilter-persistent save
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --control-plane-endpoint=192.168.0.2:6443 --v=6 # Increased verbosity

# kubeadm master initialized
mkdir -p /home/$USER/.kube


echo "use this from this user"
echo -n ":"
echo $USER
echo "sudo cp /etc/kubernetes/admin.conf ~/.kube/config"
echo 'sudo chown -R $(id -u):$(id -g) ~/.kube'
