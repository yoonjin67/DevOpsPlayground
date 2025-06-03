helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm install nfs-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=$YOUR_NFS_SERVER_IP \
    --set nfs.path=/mnt/k8s-storage-class \
    --set storageClass.defaultClass=true \
    --set storageClass.reclaimPolicy=Delete
sudo apt install -y nfs-common
