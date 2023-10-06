#!/bin/bash
# Downloads a templated config.yaml file from AWS SSM and 
# templates it using information available on the instance at-runtime

export PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
export PUBLIC_IP=$(curl -s ttp://169.254.169.254/latest/meta-data/public-ipv4)

aws ssm get-parameter --name /cluster/config/server --query "Parameter.Value" --output text > template.txt
envsubst < template.txt > /etc/rancher/k3s/config.yaml
