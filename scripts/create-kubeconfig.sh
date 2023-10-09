#!/bin/bash
echo "Downloading kubeconfig file from server"
scp xyz-server:/etc/rancher/k3s/k3s.yaml /home/skorn/Documents/k3s.yaml
echo "Downloaded. Setting KUBECONFIG env var to activate cluster env"
export KUBECONFIG=/home/skorn/Documents/k3s.yaml