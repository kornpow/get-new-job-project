source "amazon-ebs" "example" {
  region = "us-west-2"
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
  instance_type = "t4g.medium"
  ssh_username  = "ubuntu"
  ami_name      = "k3s-node-${local.timestamp}"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "file" {
    source      = "files/"
    destination = "/home/ubuntu"
  }

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y wireguard curl unzip",
      "curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE='644' INSTALL_K3S_EXEC='server' sh -s -",
      "wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_arm64.tar.gz && tar xzvf k9s_Linux_arm64.tar.gz && sudo mv k9s /usr/local/bin/",
      "echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc",
      "curl 'https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip' -o 'awscliv2.zip'",
      "unzip awscliv2.zip",
      "sudo ./aws/install",
      # "curl -Lo /usr/local/bin/k3s https://github.com/k3s-io/k3s/releases/download/v1.26.5+k3s1/k3s; chmod a+x /usr/local/bin/k3s"
    ]
  }
}