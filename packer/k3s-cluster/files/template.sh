#!/bin/bash
# Downloads a templated config.yaml file from AWS SSM and 
# templates it using information available on the instance at-runtime

export SERVER_PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
export SERVER_PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

aws ssm get-parameter --name /cluster/config/server --query "Parameter.Value" --output text > template.txt
envsubst < template.txt > /etc/rancher/k3s/config.yaml

# Save the latest server public IP to SSM so the agents can use it for their configs
aws ssm put-parameter --name /cluster/config/server_public_ip --value $SERVER_PUBLIC_IP --overwrite --type String


# TODO: get cluster token and put into SSM
# sudo cat /var/lib/rancher/k3s/server/token