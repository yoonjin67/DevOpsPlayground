#!/bin/bash
echo "Setting up NFS storage..."
apt install -y nfs-kernel-server
mkdir -p /mnt/k8s-storage-class
chown nobody:nogroup /mnt/k8s-storage-class 
chmod 777 /mnt/k8s-storage-class
echo "/mnt/k8s-storage-class 192.168.0.*/24(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
systemctl restart nfs-server
exportfs -arv
echo """
#################################################
## IF YOU ARE USING FIREWALLD:                  #
## firewall-cmd --permanent --add-service=nfs   #
## firewall-cmd --reload                        #
#################################################
## IF YOU ARE USING UFW:                       ##
## ufw allow nfs                               ##
#################################################
"""



