
#!/bin/bash
# certs=(
#   "admin" "k8s-worker01" "k8s-worker02"
#   "kube-proxy" "kube-scheduler" "kube-controller-manager"
#   "kube-api-server" "service-accounts"
# )

# for i in ${certs[*]}; do
#   openssl genrsa -out "${i}.key" 4096

#   openssl req -new -key "${i}.key" -sha256 \
#     -config "ca.conf" -section ${i} \
#     -out "${i}.csr"

#   openssl x509 -req -days 3653 -in "${i}.csr" \
#     -copy_extensions copyall \
#     -sha256 -CA "ca.crt" \
#     -CAkey "ca.key" \
#     -CAcreateserial \
#     -out "${i}.crt"
# done

# for host in k8s-worker01 k8s-worker02; do
#   ssh -i ~/.ssh/k8s root@${host} mkdir /var/lib/kubelet/

#   scp -i ~/.ssh/k8s ca.crt root@${host}:/var/lib/kubelet/

#   scp -i ~/.ssh/k8s ${host}.crt \
#     root@${host}:/var/lib/kubelet/kubelet.crt

#   scp -i ~/.ssh/k8s ${host}.key \
#     root@${host}:/var/lib/kubelet/kubelet.key
# done

# for host in k8s-worker01 k8s-worker02; do
#   kubectl config set-cluster kubernetes-the-hard-way \
#     --certificate-authority=ca.crt \
#     --embed-certs=true \
#     --server=https://k8s-server01.lab.net:6443 \
#     --kubeconfig=${host}.kubeconfig

#   kubectl config set-credentials system:node:${host} \
#     --client-certificate=${host}.crt \
#     --client-key=${host}.key \
#     --embed-certs=true \
#     --kubeconfig=${host}.kubeconfig

#   kubectl config set-context default \
#     --cluster=kubernetes-the-hard-way \
#     --user=system:node:${host} \
#     --kubeconfig=${host}.kubeconfig

#   kubectl config use-context default \
#     --kubeconfig=${host}.kubeconfig
# done

# kubectl config set-cluster kubernetes-the-hard-way \
#     --certificate-authority=ca.crt \
#     --embed-certs=true \
#     --server=https://k8s-server01.lab.net:6443 \
#     --kubeconfig=kube-proxy.kubeconfig

#   kubectl config set-credentials system:kube-proxy \
#     --client-certificate=kube-proxy.crt \
#     --client-key=kube-proxy.key \
#     --embed-certs=true \
#     --kubeconfig=kube-proxy.kubeconfig

#   kubectl config set-context default \
#     --cluster=kubernetes-the-hard-way \
#     --user=system:kube-proxy \
#     --kubeconfig=kube-proxy.kubeconfig

#   kubectl config use-context default \
#     --kubeconfig=kube-proxy.kubeconfig

# kubectl config set-cluster kubernetes-the-hard-way \
#     --certificate-authority=ca.crt \
#     --embed-certs=true \
#     --server=https://k8s-server01.lab.net:6443 \
#     --kubeconfig=kube-controller-manager.kubeconfig

#   kubectl config set-credentials system:kube-controller-manager \
#     --client-certificate=kube-controller-manager.crt \
#     --client-key=kube-controller-manager.key \
#     --embed-certs=true \
#     --kubeconfig=kube-controller-manager.kubeconfig

#   kubectl config set-context default \
#     --cluster=kubernetes-the-hard-way \
#     --user=system:kube-controller-manager \
#     --kubeconfig=kube-controller-manager.kubeconfig

#   kubectl config use-context default \
#     --kubeconfig=kube-controller-manager.kubeconfig

# kubectl config set-cluster kubernetes-the-hard-way \
#     --certificate-authority=ca.crt \
#     --embed-certs=true \
#     --server=https://k8s-server01.lab.net:6443 \
#     --kubeconfig=kube-scheduler.kubeconfig

#   kubectl config set-credentials system:kube-scheduler \
#     --client-certificate=kube-scheduler.crt \
#     --client-key=kube-scheduler.key \
#     --embed-certs=true \
#     --kubeconfig=kube-scheduler.kubeconfig

#   kubectl config set-context default \
#     --cluster=kubernetes-the-hard-way \
#     --user=system:kube-scheduler \
#     --kubeconfig=kube-scheduler.kubeconfig

#   kubectl config use-context default \
#     --kubeconfig=kube-scheduler.kubeconfig

# kubectl config set-cluster kubernetes-the-hard-way \
#     --certificate-authority=ca.crt \
#     --embed-certs=true \
#     --server=https://127.0.0.1:6443 \
#     --kubeconfig=admin.kubeconfig

#   kubectl config set-credentials admin \
#     --client-certificate=admin.crt \
#     --client-key=admin.key \
#     --embed-certs=true \
#     --kubeconfig=admin.kubeconfig

#   kubectl config set-context default \
#     --cluster=kubernetes-the-hard-way \
#     --user=admin \
#     --kubeconfig=admin.kubeconfig

#   kubectl config use-context default \
#     --kubeconfig=admin.kubeconfig

for host in k8s-worker01 k8s-worker02; do
  ssh -i ~/.ssh/k8s root@${host} "mkdir -p /var/lib/{kube-proxy,kubelet}"

  scp -i ~/.ssh/k8s kube-proxy.kubeconfig \
    root@${host}:/var/lib/kube-proxy/kubeconfig \

  scp -i ~/.ssh/k8s ${host}.kubeconfig \
    root@${host}:/var/lib/kubelet/kubeconfig
done