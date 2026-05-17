#! /bin/bash
ssh -T -i ~/.ssh/k8s root@k8s-server01 <<EOF
  ip route add ${NODE_0_SUBNET} via ${NODE_0_IP}
  ip route add ${NODE_1_SUBNET} via ${NODE_1_IP}
EOF